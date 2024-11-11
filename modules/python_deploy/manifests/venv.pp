# SPDX-License-Identifier: Apache-2.0
# @summary Deploy Python code in a virtualenv
#
# Deploy the bits needed to be able to deploy Python code in a simple manner, basically
# mimicking what scap does for the repositories of Python3 software that has frozen
# wheels and needs to be deployed in a virtualenv.
# This define was born as a workaround to not be blocked by the migration of Scap to
# Python 3 and might or might be not used after that.
#
# This define and scap::target are mutually exclusive, including both will results in
# compilation errors.
#
# @param project_name String The name of the project to deploy. Defaults to the title of the resource.
# @param deploy_user String The user that will own the deployment directory. Defaults to "deploy-${title}".
# @param add_home_dir Boolean Whether to create a home directory for the deploy user. Defaults to false.
define python_deploy::venv (
    String $project_name = $title,
    String $deploy_user = "deploy-${title}",
    Boolean $add_home_dir = false,
) {
    include python_deploy
    if $add_home_dir {
        $home_dir = "/var/lib/${deploy_user}"
        wmflib::dir::mkdir_p($home_dir)
        $params = { home_dir => $home_dir }
    } else {
        $params = {}
    }

    ensure_resources('systemd::sysuser', { $deploy_user => $params })

    file { "/srv/deployment/${project_name}":
        ensure => directory,
        owner  => $deploy_user,
        group  => 'root',
        mode   => '0755',
    }
}
