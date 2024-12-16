# SPDX-License-Identifier: Apache-2.0
# Class: profile::ceph::client
#
# This profile provides common configuration for Ceph clients.
    class profile::ceph::client (
    Hash[String,Hash]          $mon_hosts                 = lookup('profile::ceph::mon::hosts'),
    Stdlib::Unixpath           $data_dir                  = lookup('profile::ceph::data_dir', { default_value => '/var/lib/ceph' }),
    String                     $fsid                      = lookup('profile::ceph::fsid'),
    String                     $ceph_repository_component = lookup('profile::ceph::ceph_repository_component'),
    ) {
    require profile::ceph::auth::deploy

    class { 'ceph::common':
        home_dir                  => $data_dir,
        ceph_repository_component => $ceph_repository_component,
    }

    class { 'ceph::minimal_config':
        fsid      => $fsid,
        mon_hosts => $mon_hosts,
    }
}
