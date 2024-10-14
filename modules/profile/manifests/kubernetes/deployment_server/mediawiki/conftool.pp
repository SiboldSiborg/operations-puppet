# SPDX-License-Identifier: Apache-2.0
class profile::kubernetes::deployment_server::mediawiki::conftool(
    Stdlib::Unixpath $general_dir = lookup('profile::kubernetes::deployment_server::global_config::general_dir', {default_value => '/etc/helmfile-defaults'}),
) {
    # T367118 conftool state for maintenance job control
    confd::file { "${general_dir}/mediawiki/conftool-state.yaml":
        ensure     => present,
        prefix     => '/mediawiki-config',
        watch_keys => ['/'],
        content    => template('profile/conftool/helmfile-mediawiki-state.tmpl.erb'),
    }
}
