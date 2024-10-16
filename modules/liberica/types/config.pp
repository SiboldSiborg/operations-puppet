# SPDX-License-Identifier: Apache-2.0
# Liberica config, please see the documentation of each datatype
# for further details
type Liberica::Config = Struct[{
        'hcforwarder' => Liberica::HcforwarderConfig,
        'healthcheck' => Liberica::HealthcheckConfig,
        'fp'          => Liberica::FpConfig,
        'cp'          => Liberica::CpConfig,
        'etcd'        => Liberica::EtcdConfig,
        'bgp'         => Liberica::BgpConfig,
        'services'    => Hash[String, Liberica::Service, 1],
}]
