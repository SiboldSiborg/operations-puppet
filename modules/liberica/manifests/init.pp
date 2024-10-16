# SPDX-License-Identifier: Apache-2.0
class liberica(
    Liberica::Config $config,
) {
    ensure_packages(['bpftool', 'ipvsadm', 'gobgpd', 'liberica'])

    file { '/etc/gobgpd.conf':
        ensure  => present,
        mode    => '0444',
        content => template('liberica/gobgpd.conf.erb'),
    }

    file { '/etc/liberica':
        ensure => directory,
    }

    file { '/etc/liberica/config.yaml':
        ensure  => present,
        owner   => 'root',
        content => to_yaml($config),
        require => [File['/etc/liberica'], Package['liberica']],
    }

    systemd::sysuser { 'liberica':
        shell => '/bin/bash',
    }

    systemd::service { 'liberica-hcforwarder':
        ensure  => present,
        content => systemd_template('liberica-hcforwarder'),
        restart => false,
        require => File['/etc/liberica/config.yaml'],
    }

    systemd::service { 'liberica-healthcheck':
        ensure  => present,
        content => systemd_template('liberica-healthcheck'),
        restart => false,
        require => File['/etc/liberica/config.yaml'],
    }

    systemd::service { 'liberica-fp':
        ensure  => present,
        content => systemd_template('liberica-fp'),
        restart => false,
        require => File['/etc/liberica/config.yaml'],
    }

    systemd::service { 'liberica-cp':
        ensure  => present,
        content => systemd_template('liberica-cp'),
        restart => false,
        require => [File['/etc/liberica/config.yaml'], Systemd::Sysuser['liberica']],
    }
}
