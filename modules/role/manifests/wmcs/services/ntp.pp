# == Class role::wmcs::services::ntp
#
# Ntp server role, to be applied to a cloud instance
class role::wmcs::services::ntp {
    include profile::wmcs::services::ntp
}
