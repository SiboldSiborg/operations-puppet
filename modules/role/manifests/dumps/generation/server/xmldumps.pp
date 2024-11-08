class role::dumps::generation::server::xmldumps {
    include profile::base::production
    include profile::firewall
    include profile::dumps::generation::server::xmldumps
    include profile::dumps::nfs
    include profile::dumps::generation::server::rsync_firewall
    include profile::dumps::rsyncer_peer
    include profile::dumps::generation::server::cleanup
    include profile::dumps::generation::server::jobswatcher
    include profile::dumps::generation::server::exceptionchecker
}
