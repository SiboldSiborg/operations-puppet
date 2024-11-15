# Role class for deployment servers in deployment-prep
#
class role::beta::deploymentserver {
    include profile::beta::autoupdater
    include role::beta::mediawiki
    include profile::beta::deploymentserver_docker_group
}
