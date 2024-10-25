class role::swift::proxy {
    include profile::base::production
    include profile::firewall
    include profile::conftool::client
    include profile::prometheus::memcached_exporter
    include profile::swift::proxy
}
