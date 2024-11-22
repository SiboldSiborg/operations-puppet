class role::analytics_cluster::zookeeper {
    include profile::base::production
    include profile::firewall

    include profile::zookeeper::server
    include profile::zookeeper::firewall
}
