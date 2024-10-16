# SPDX-License-Identifier: Apache-2.0
# etcd settings used by Liberica control plane
# [*conftool_domain*]
#  Base domain used to perform DNS discovery of the etcd cluster.
# [*datacenter*]
#  This will be used as /conftool/v1/pools/$datacenter/$cluster/$service when
#  fetching realservers from etcd
type Liberica::EtcdConfig = Struct[{
        'conftool_domain' => Stdlib::Fqdn,
        'datacenter'      => Wmflib::Sites,
}]
