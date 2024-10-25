class role::thanos::backend {
    include profile::base::production
    include profile::firewall

    include profile::thanos::swift::backend
}
