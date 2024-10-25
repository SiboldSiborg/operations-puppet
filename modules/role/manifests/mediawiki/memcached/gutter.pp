# Role for the MediaWiki memcached gutter/failover cluster role for production.
class role::mediawiki::memcached::gutter {
    include profile::base::production
    include profile::firewall
    include profile::memcached::instance
    include profile::memcached::memkeys
    include profile::memcached::performance
}
