# Class: role::analytics_cluster::hadoop::yarn
#
# Hadoop Yarn UI
#
class role::analytics_cluster::hadoop::yarn {
    include profile::java

    include profile::tlsproxy::envoy

    include profile::hadoop::yarn_proxy

    include profile::kerberos::client
    include profile::kerberos::keytabs

    include profile::firewall
    include profile::base::production
}
