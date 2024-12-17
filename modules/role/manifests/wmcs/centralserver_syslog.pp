# == Class role::wmcs::centralserver_syslog
#
# Setup rsyslog as a receiver of cluster wide syslog messages.
#
class role::wmcs::centralserver_syslog {
    include profile::base::labs
    include profile::firewall

    include profile::syslog::centralserver
}
