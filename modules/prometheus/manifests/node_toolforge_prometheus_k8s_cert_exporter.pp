# SPDX-License-Identifier: Apache-2.0
class prometheus::node_toolforge_prometheus_k8s_cert_exporter (
    Stdlib::Unixpath $certificate_path,
    Wmflib::Ensure   $ensure      = 'present',
) {
    $script = '/usr/local/bin/prometheus-k8s-cert-exporter'
    file { $script:
        ensure => stdlib::ensure($ensure, 'file'),
        owner  => 'root',
        group  => 'root',
        mode   => '0550',
        source => 'puppet:///modules/prometheus/usr/local/bin/prometheus_k8s_cert_exporter.sh',
    }

    systemd::timer::job { 'prometheus-node-prometheus-k8s-cert-exporter':
        ensure      => stdlib::ensure($ensure),
        user        => 'root',
        description => 'Generate prometheus metrics about the expiry of the k8s cert prometheus uses to fetch stats',
        command     => "${script} '${certificate_path}'",
        interval    => {
            'start'    => 'OnCalendar',
            'interval' => 'daily',
        },
    }
}
