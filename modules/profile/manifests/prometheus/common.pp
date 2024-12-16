# SPDX-License-Identifier: Apache-2.0

# Common functionality shared across Prometheus server instances
class profile::prometheus::common (
    Optional[Stdlib::HTTPUrl] $http_proxy = lookup('http_proxy', {default_value => undef}),
) {

    # We need a deterministic location for client certificates to use for exported
    # blackbox checks e.g. prometheus::blackbox::check::{http,tcp} with use_client_auth
    puppet::expose_agent_certs { '/etc/prometheus':
        ensure          => 'present',
        user            => 'prometheus',
        provide_private => true,
    }

    class{ '::prometheus::blackbox_exporter':
        http_proxy => $http_proxy,
    }

    # Local blackbox_exporter needs configuration (modules) generated from service::catalog
    class { '::prometheus::blackbox::modules::service_catalog':
        services_config => wmflib::service::fetch(),
    }
}
