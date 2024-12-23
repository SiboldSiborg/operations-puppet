# SPDX-License-Identifier: Apache-2.0
# == Class role::wmcs::services::dnsrecursor
#
# A simple dns recursor meant to run within cloud-vps. An experiment
#  inspired by T374830
class role::wmcs::services::dnsrecursor {
    include profile::wmcs::services::dnsrecursor
}
