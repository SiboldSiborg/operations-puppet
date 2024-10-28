# temp allow rsyncing gerrit data to new server
class role::gerrit::migration {
    include profile::base::production
    include profile::firewall
    include profile::gerrit::migration_base
    include profile::gerrit::migration
}
