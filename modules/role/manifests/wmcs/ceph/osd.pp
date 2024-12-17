class role::wmcs::ceph::osd {
    include profile::base::production
    include profile::firewall
    include profile::base::cloud_production
    include profile::cloudceph::auth::deploy
    include profile::cloudceph::osd
}
