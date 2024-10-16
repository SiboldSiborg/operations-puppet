# SPDX-License-Identifier: Apache-2.0
# Liberica Idle TCP Connection healthcheck configuration
# [*timeout*]
#  timeout to perform the HTTP request (5s, 5000ms)
# [*check_period*]
#  time between checks (3s, 3000ms)
# [*reconnect_period*]
#  waiting time between reconnect attempts after a
#  failed attempt (3s, 3000ms)
type Liberica::IdleTCPConnectionCheck = Struct[{
        'timeout'          => String[2],
        'check_period'     => String[2],
        'reconnect_period' => String[2],
}]
