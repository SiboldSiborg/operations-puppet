# SPDX-License-Identifier: Apache-2.0
# Grpc endpoint related configuration, it's used by clients and servers
# [*network*]
#  tcp or unix domain sockets
# [*address*]
#  string with format `[host]:port` if network is set to tcp or an absolute path if
#  network is set to unix
type Liberica::Grpc = Struct[{
        'network' => Enum['tcp', 'unix'],
        'address' => Variant[String, Stdlib::Unixpath],
}]
