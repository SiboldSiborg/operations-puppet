# SPDX-License-Identifier: Apache-2.0
# Liberica healthcheck forwarder daemon config
# [*log_level*]
#  log level
# [*grpc*]
#  grpc config, it will be used as listener config by the hcforwarder daemon
#  and as client config by the control plane daemon
# [*prometheus*]
#  prometheus endpoint configuration
# [*hashing_algorithm*]
#  Hashing algorithm used by the control plane to assign a SOMARK to each
#  realserver address (jenkins, siphash). Changes in this setting require
#  a restart of both hcforwarder and control plane daemons
# [*egress*]
#  Name of the network interface used to send healthchecks
# [*v4*]
#  Name of the network interface used to encapsulate IPv4 healthchecks
#  (usually ipip0)
# [*v6*]
#  Name of the network interface used to encapsulate IPv6 healthchecks
#  (usually ipip60)
type Liberica::HcforwarderConfig = Struct[{
        'log_level'         => Liberica::Logging,
        'grpc'              => Liberica::Grpc,
        'prometheus'        => Liberica::Prometheus,
        'hashing_algorithm' => Enum['jenkins', 'siphash'],
        'egress'            => String,
        'v4'                => String,
        'v6'                => String,
}]
