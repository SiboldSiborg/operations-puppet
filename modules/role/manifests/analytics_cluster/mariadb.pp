# SPDX-License-Identifier: Apache-2.0
class role::analytics_cluster::mariadb {
    include profile::base::production
    include profile::firewall
    include profile::analytics::database::meta
}
