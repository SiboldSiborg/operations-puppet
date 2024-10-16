# SPDX-License-Identifier: Apache-2.0
# Liberica healthcheck daemon config
# [*log_level*]
#  log level
# [*grpc*]
#  grpc config, it will be used as listener config by the forwarding plane daemon
#  and as client config by the control plane daemon
# [*prometheus*]
#  prometheus endpoint configuration
type Liberica::HealthcheckConfig = Struct[{
        'log_level'  => Liberica::Logging,
        'grpc'       => Liberica::Grpc,
        'prometheus' => Liberica::Prometheus,
}]
