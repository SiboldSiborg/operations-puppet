# SPDX-License-Identifier: Apache-2.0

class role::analytics_cluster::airflow::search {
    include profile::analytics::cluster::airflow
    include profile::analytics::cluster::repositories::statistics
    include profile::analytics::refinery
}
