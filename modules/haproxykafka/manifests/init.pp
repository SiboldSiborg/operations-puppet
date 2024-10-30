# SPDX-License-Identifier: Apache-2.0
# == Class: haproxykafka
#
# Install haproxykafka, dependencies and service files
#
# [*ensure*]
#   present or absent.
#
# [*config*]
#   Haproxykafka::Config struct used to build the actual configuration.
#
# [*user*]
#   The user to run haproxykafka, used to set permissions on files and
#   directories.
#   Defaults to haproxykafka.
#

class haproxykafka (
    Wmflib::Ensure       $ensure,
    Haproxykafka::Config $config,
    String               $user = 'haproxykafka',
) {
    package { 'haproxykafka':
        ensure  => $ensure,
    }

    # TODO: from param/hiera
    file { '/var/run/haproxykafka':
        ensure => stdlib::ensure($ensure, 'directory'),
        owner  => $user,
        mode   => '0755',
        force  => true,
    }

    $confdir = '/etc/haproxykafka'
    $conffile = 'config.yaml'
    $conffile_full_path = "${confdir}/${conffile}"

    file { $confdir:
        ensure => stdlib::ensure($ensure, 'directory'),
        force  => true,
    }

    file { $conffile_full_path:
        ensure  => $ensure,
        owner   => $user,
        mode    => '0444',
        content => to_yaml($config),
        require => [File[$confdir], Package['haproxykafka']],
    }

    systemd::service { 'haproxykafka':
        ensure  => $ensure,
        content => systemd_template('haproxykafka'),
        restart => true,
        require => File[$conffile_full_path],
    }
}
