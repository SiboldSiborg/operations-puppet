# SPDX-License-Identifier: Apache-2.0
class role::ncmonitor {
    include profile::base::production
    include profile::firewall
    include profile::ncmonitor
}
