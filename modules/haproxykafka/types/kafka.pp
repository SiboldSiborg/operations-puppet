# SPDX-License-Identifier: Apache-2.0
# @summary configuration for the Kafka producer
#
# @param topic
#   The Kafka topic name where correctly parsed and validated
#   messages are sent.
#
# @param dlq_topic
#   Dead Letter Queue topic name, where errored messages are sent
#
# @param flush_timeout
#   Time in millisecond to wait before closing the Kafka producer
#   instance after trying to flush all remaining messages.
#
# @param batch_size
#   The batch size for message units that are dispatched to Kafka
#
# @param batch_deadline
#   Amount of time the dispatcher waits before sending messages to
#   the Kafka producer, even if the batch isn't full.
#   Expressed as go parsable timing notation (eg. 100ms).
#
# @param rdkafka
#   Haproxykafka::Rdkafka element containing the librdkafka configuration
#

type Haproxykafka::Kafka = Struct[{
    'topic'          => String,
    'dlq_topic'      => String,
    'flush_timeout'  => Integer[100,10000],
    'batch_size'     => Integer[1024],
    'batch_deadline' => String,
    'rdkafka'        => Haproxykafka::Rdkafka,
}]
