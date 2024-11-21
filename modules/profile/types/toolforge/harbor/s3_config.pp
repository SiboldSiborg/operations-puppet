# SPDX-License-Identifier: Apache-2.0
type Profile::Toolforge::Harbor::S3_config = Struct[{
  'region' => String[1],
  'bucket' => String[1],
  'accesskey' => String[1],
  'secretkey' => String[1],
  'regionendpoint' => Stdlib::Fqdn,
}]
