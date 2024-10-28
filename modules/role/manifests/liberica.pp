# SPDX-License-Identifier: Apache-2.0
class role::liberica {
    include profile::base::production
    include profile::base::no_firewall
    include profile::liberica
}
