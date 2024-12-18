class role::orchestrator {
    include profile::base::production
    include profile::firewall
    include profile::orchestrator::web
    include profile::orchestrator::server
    include profile::orchestrator::monitoring
    include profile::mariadb::client
}
