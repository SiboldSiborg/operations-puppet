# SPDX-License-Identifier: Apache-2.0
# @summary cloud vps global puppetserver
class role::puppetserver::cloud_vps_global {
    include profile::puppetserver::wmcs
    include profile::puppetserver::scripts

    include profile::openstack::base::puppetserver::cert_cleaning
}
