# SPDX-License-Identifier: Apache-2.0
# Prometheus related configuration
# [*address*]
#  Address used to bind the HTTP server with prometheus metrics, examples: ":1234", "127.0.0.1:1234"
type Liberica::Prometheus = Struct[{
        'address' => String,
}]
