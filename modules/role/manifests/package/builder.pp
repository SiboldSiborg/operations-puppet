# SPDX-License-Identifier: Apache-2.0
# == Class: role::package::builder
#
# Role for a simple package_builder in Cloud VPS
#
class role::package::builder {
    include profile::base::production
    include profile::firewall
    include profile::package_builder
}
