# SPDX-License-Identifier: Apache-2.0
# Liberica HTTP healthcheck configuration
# [*url*]
#  URL that will be checked. Host header of the request will be extracted from
#  the host part of the URL
# [*status_code*]
#  expected status code
# [*timeout*]
#  timeout to perform the HTTP request (5s, 5000ms)
# [*check_period*]
#  time between checks (3s, 3000ms)
type Liberica::HTTPCheck = Struct[{
        'url'          => Stdlib::HTTPUrl,
        'status_code'  => Stdlib::Http::Status,
        'timeout'      => String[2],
        'check_period' => String[2],
}]

