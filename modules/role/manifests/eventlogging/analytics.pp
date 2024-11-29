class role::eventlogging::analytics {
    include profile::base::production
    include profile::firewall

    include profile::eventlogging::analytics::processor
}
