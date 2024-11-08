# serve dumps of revision content from restbase, in html format
class role::dumps::web::htmldumps {
    include profile::base::production
    include profile::firewall
    include profile::nginx
    include profile::dumps::web::htmldumps
}
