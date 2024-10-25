# SPDX-License-Identifier: Apache-2.0
# @summary configuration for debug and prometheus monitoring
#
# @param enable_pprof
#   Boolean switch to enable pprof debug endpoints
#
# @param enable_prometheus
#   Boolean switch to enable prometheus endpoints
#
# @param server_bind
#   Listening address for pprof and prometheus requests
#   expressed as [ADDRESS]:PORT (eg. ":9341")
#
# @param prometheus_prefix
#   Prometheus prefix for non-internal metrics
#   (currently unused)
#
# @param prometheus_parsing_buckets
#   List of buckets for the log parsing time measurements, expressed
#   in scientific notation (eg. [1e-6, 1e-5, 1e-4])
#
# @param prometheus_processing_buckets
#   List of buckets for the log processing time measurements, expressed
#   in scientific notation (eg. [1e-6, 1e-5, 1e-4])
#

type Haproxykafka::Monitoring = Struct[{
    'enable_pprof'                  => Boolean,
    'enable_prometheus'             => Boolean,
    'server_bind'                   => String,
    'prometheus_prefix'             => String,
    'prometheus_parsing_buckets'    => Array[Float],
    'prometheus_processing_buckets' => Array[Float],
}]
