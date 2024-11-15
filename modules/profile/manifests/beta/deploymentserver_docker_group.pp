# SPDX-License-Identifier: Apache-2.0

class profile::beta::deploymentserver_docker_group (
    $docker_packagename = lookup('profile::docker::engine::packagename', { 'default_value' => 'docker.io' }),
) {
    $admin_module_path = get_module_path('admin')
    $admin_data = loadyaml("${admin_module_path}/data/data.yaml")
    $scap_installers = $admin_data['groups']['release-engineering']['members']

    $docker_users = ['mwbuilder'] + $scap_installers

    $docker_users.each |$user| {
        exec { "${user} user docker membership":
            unless  => "/usr/bin/id -Gn '${user}' | /bin/grep -qw docker",
            command => "/usr/sbin/usermod -aG docker '${user}'",
            require => [
                Package[$docker_packagename],
            ],
        }
    }
}
