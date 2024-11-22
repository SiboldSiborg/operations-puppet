# Class: role::analytics_cluster::turnilo
#
class role::analytics_cluster::turnilo {
    include profile::druid::turnilo
    include profile::druid::turnilo::proxy
    include profile::tlsproxy::envoy
    include profile::firewall
    include profile::base::production
}
