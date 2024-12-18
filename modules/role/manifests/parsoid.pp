# == Class: role::parsoid
#
class role::parsoid {
    include role::mediawiki::common
    include profile::firewall
    include profile::parsoid
    include profile::prometheus::apache_exporter

    include profile::rsyslog::udp_localhost_compat
}
