# SPDX-License-Identifier: Apache-2.0
# @summary Manages a Keepalived installation
# @param config Keepalived config file
class keepalived(
    String[1] $config,
) {
    if debian::codename::eq('bullseye') {
        # default keepalived in bullseye seems broken, see
        # https://bugs.debian.org/1008222
        apt::package_from_bpo { 'keepalived':
            distro => 'bullseye',
        }
    }

    package { 'keepalived':
        ensure => present,
    }

    $conf_file = '/etc/keepalived/keepalived.conf'
    file { $conf_file :
        ensure    => present,
        mode      => '0444',
        owner     => 'root',
        group     => 'root',
        content   => $config,
        show_diff => false,
        require   => Package['keepalived'],
    }

    service { 'keepalived':
        ensure    => running,
        subscribe => [
            Package['keepalived'],
            File[$conf_file],
        ],
    }
}
