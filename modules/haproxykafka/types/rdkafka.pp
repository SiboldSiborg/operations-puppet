# SPDX-License-Identifier: Apache-2.0
#
# @common librdkafka parameters used by haproxykafka
#
# Note: These parameters are implicitly translated into
#       librdkafka configuration properties without any modification.
#       Please refer to https://docs.confluent.io/platform/current/clients/librdkafka/html/md_CONFIGURATION.html
#       for a complete list of available options.
#

type Haproxykafka::Rdkafka = Struct[{
    'acks'                         => String,
    'client.id'                    => String,
    'bootstrap.servers'            => Optional[String],
    'security.protocol'            => String,
    'ssl.ca.location'              => Stdlib::Unixpath,
    'ssl.cipher.suites'            => String,
    'ssl.curves.list'              => String,
    'ssl.sigalgs.list'             => String,
    'queue.buffering.max.messages' => Integer,
    'queue.buffering.max.ms'       => Integer,
    'batch.num.messages'           => Integer,
    'compression.codec'            => Enum['none', 'gzip', 'snappy', 'lz4', 'zstd'],
    'topic.request.required.acks'  => Integer,
}]
