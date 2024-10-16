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
type Liberica::HcforwarderConfig = Struct[{
        'log_level'         => Liberica::Logging,
        'grpc'              => Liberica::Grpc,
        'prometheus'        => Liberica::Prometheus,
        'hashing_algorithm' => Enum['jenkins', 'siphash'],
}]
