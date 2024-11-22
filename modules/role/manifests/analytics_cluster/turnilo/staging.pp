# SPDX-License-Identifier: Apache-2.0
# Class: role::analytics_cluster::turnilo::staging
#
class role::analytics_cluster::turnilo::staging {
    include profile::druid::turnilo
    include profile::firewall
    include profile::base::production
}
