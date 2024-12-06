class role::wmcs::db::wikireplicas::dedicated::analytics_multiinstance {
    include profile::base::production
    include profile::wmcs::db::wikireplicas::mariadb_multiinstance
    include profile::firewall
    include profile::wmcs::db::wikireplicas::views
    include profile::mariadb::check_private_data
    include profile::wmcs::db::wikireplicas::dedicated::analytics
}
