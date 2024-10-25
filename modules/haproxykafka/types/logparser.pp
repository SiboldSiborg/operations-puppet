# SPDX-License-Identifier: Apache-2.0
# @summary configuration for the logparser pipeline section
#
# @param batch_size
#   The batch size for message processed by the log parser.
#
# @param batch_deadline
#   Amount of time the log processor waits before sending messages to
#   the next pipeline section, even if the batch isn't full.
#   Expressed as go parsable timing notation (eg. 100ms).
#

type Haproxykafka::Logparser = Struct[{
    'batch_size'     => Integer[1024],
    'batch_deadline' => String,
}]
