# SPDX-License-Identifier: Apache-2.0
# BGP related configuration
# [*grpc*]
#  grpc client configuration used by Liberica control plane to reach the BGP daemon
# [*asn*]
#  AS number
# [*peers*]
#  List of BGP peers
# [*next_hop_ipv4*]
#  Next hop used for IPv4 prefixes
# [*next_hop_ipv6*]
#  Next hop used for IPv6 prefixes
# [*communities*]
#  List of communities that will be used for every BGP prefix announced by Liberica
type Liberica::BgpConfig = Struct[{
        'grpc'          => Liberica::Grpc,
        'asn'           => Integer[64512, 65534],
        'peers'         => Array[Stdlib::IP::Address::Nosubnet],
        'next_hop_ipv4' => Stdlib::IP::Address::V4::Nosubnet,
        'next_hop_ipv6' => Stdlib::IP::Address::V6::Nosubnet,
        'communities'   => Optional[Array[String]],
}]
