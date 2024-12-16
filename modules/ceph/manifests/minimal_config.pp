# SPDX-License-Identifier: Apache-2.0
# Class: ceph::minimal_config
#
# This class is used to generate a minimal ceph config that is to be used on clients.
# It is intended to replicate the functionality of the command: ceph config generate-minimal-conf`
#
# See https://docs.ceph.com/en/reef/cephadm/client-setup/ for more information
#
# Parameters
#    - $mon_hosts
#        Hash that defines the ceph monitor host's public and private IPv4 information
#    - $fsid
#        Ceph filesystem ID
class ceph::minimal_config (
    Hash[String,Hash]           $mon_hosts,
    String                      $fsid,
) {
    Class['ceph::common'] -> Class['ceph::minimal_config']

    file { '/etc/ceph/ceph.conf':
        ensure  => present,
        mode    => '0444',
        owner   => 'root',
        group   => 'root',
        content => epp('ceph/ceph.minimal.conf.epp', {
            fsid      => $fsid,
            mon_hosts => $mon_hosts,
        }),
        require => Package['ceph-common'],
    }
}
