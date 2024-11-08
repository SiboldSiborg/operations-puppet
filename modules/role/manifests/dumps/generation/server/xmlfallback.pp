class role::dumps::generation::server::xmlfallback {
    include profile::base::production
    include profile::firewall
    include profile::dumps::nfs
    include profile::dumps::generation::server::rsync_firewall
    include profile::dumps::rsyncer_peer
    include profile::dumps::generation::server::cleanup
    include profile::dumps::generation::server::dumpstatusfiles_sync
    include profile::dumps::generation::server::statsender
    include profile::dumps::generation::server::common
    include profile::dumps::generation::server::jobswatcher
    include profile::dumps::generation::server::exceptionchecker
}
