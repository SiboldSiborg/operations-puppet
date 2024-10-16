# SPDX-License-Identifier: Apache-2.0
# Liberica control plane daemon config
# [*log_level*]
#  log level
# [*prometheus*]
#  prometheus endpoint configuration
type Liberica::CpConfig = Struct[{
        'log_level'  => Liberica::Logging,
        'prometheus' => Liberica::Prometheus,
}]
