# SPDX-License-Identifier: Apache-2.0
class role::memcached{
    include profile::base::production
    include profile::firewall
    include profile::memcached::instance
    #include profile::memcached::memkeys
    include profile::memcached::performance
}
