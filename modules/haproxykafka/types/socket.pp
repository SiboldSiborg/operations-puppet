# SPDX-License-Identifier: Apache-2.0
# @summary configuration for the listening socket
#
# @param path
#   Path of the listening unix domain socket that will be
#   created. Must match Haproxy configuration
#
# @param mode
#   The permissions on the unix domain socket as set by `chown`
#
# @param user
#   Owner of the socket. Must exist
#
# @param group
#   Group owner for the socket. Must exist
#
# @param batch_size
#   The batch size for messages read on the socket.
#
# @param batch_deadline
#   Amount of time the socket reading element waits before sending
#   messages to the next pipeline section, even if the batch isn't full.
#   Expressed as go parsable timing notation (eg. 100ms).
#

type Haproxykafka::Socket = Struct[{
    'path'           => Stdlib::Unixpath,
    'mode'           => Stdlib::Filemode,
    'user'           => String,
    'group'          => String,
    'batch_size'     => Integer[1024],
    'batch_deadline' => String,
}]
