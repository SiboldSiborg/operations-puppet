# SPDX-License-Identifier: Apache-2.0
#
# == Class role::wmcs::services::etcd_discovery
#
# Install and configure etcd_discovery service,
#  https://github.com/etcd-io/discoveryserver
#
# This is used by magnum-managed etcd nodes.
class role::wmcs::services::etcd_discovery {
    include profile::wmcs::services::etcd_discovery
}
