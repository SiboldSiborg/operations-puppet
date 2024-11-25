#!/bin/bash
#- SPDX-License-Identifier: Apache-2.0
set -o nounset
set -o pipefail
set -o errexit

certificate_path="${1?No certificate path passed}"
prom_file="/var/lib/prometheus/node.d/prom_k8s_cert_expiry.prom"

end_date=$(openssl x509 -in "$certificate_path" -noout -enddate | cut -d= -f2)
in_seconds=$(date --date="$end_date" +%s)
cur_date=$(date +%s)
diff=$((in_seconds - cur_date))

cat >"$prom_file" <<EOP
# HELP prometheus_k8s_cert_seconds_until_expiration Seconds until the certificate prometheus uses to scrape k8s expires
# TYPE prometheus_k8s_cert_seconds_until_expiration gauge
prometheus_k8s_cert_seconds_until_expiration $diff
EOP

