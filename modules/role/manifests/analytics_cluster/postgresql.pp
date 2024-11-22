# SPDX-License-Identifier: Apache-2.0
class role::analytics_cluster::postgresql {
    include profile::base::production
    include profile::firewall
    include profile::analytics::postgresql
    include profile::prometheus::postgres_exporter
}
