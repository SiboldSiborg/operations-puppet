# SPDX-License-Identifier: Apache-2.0
class role::insetup::data_engineering {
    include profile::base::production
    include profile::firewall
}
