# SPDX-License-Identifier: Apache-2.0
type Haproxykafka::Transformrules = Struct[{
    'haproxy_format' => String,
    'date_format'    => String,
    'date_tz'        => String,
}]
