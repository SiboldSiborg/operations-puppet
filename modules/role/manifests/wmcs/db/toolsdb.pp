# SPDX-License-Identifier: Apache-2.0
class role::wmcs::db::toolsdb {
    include profile::mariadb::monitor
    include profile::wmcs::services::toolsdb
}
