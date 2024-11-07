# SPDX-License-Identifier: Apache-2.0
# == Class profile::cache::kafka::certificate
# Installs certificates and keys for varnishkafka to produce to Kafka over TLS.
# This expects that a 'varnishkafka' SSL/TLS key and certificate is created by Cergen and
# signed by our PuppetCA, and available in the Puppet private secrets module.
#
# == Parameters.
#
# [*ssl_key_password*]
#   The password to decrypt the TLS client certificate.  Default: undef
#
# [*certificate_name*]
#   Name of certificate (cergen) in the secrets module.  This will be used
#   To find the certificate file secret() puppet paths.
#
# [*certificate_name*]
#   Name of certificate (cergen) in the secrets module.  This will be used
#   To find the certificate file secret() puppet paths.  You might want to
#   change this if you are testing in Cloud VPS.  Default: varnishkafka.
#
# [*use_internal_ca*]
#   If true, the CA cert.pem file will be assumed to be already installed at
#   /etc/ssl/certs/wmf-ca-certificates.crt, and will be used as the ssl.ca.location
#   for varnishkafka/librdkafka.  Default: true.  Set this to false if the
#   certificate name you set is not signed by the Puppet CA, and the
#   cergen created ca.crt.pem file will be used.
#
class profile::cache::kafka::certificate(
    Optional[String] $ssl_key_pass = lookup('profile::cache::kafka::certificate::ssl_key_password', {'default_value' => undef}),
    String $certificate_name           = lookup('profile::cache::kafka::certificate::certificate_name', {'default_value' => 'varnishkafka'}),
    Boolean $use_internal_ca           = lookup('profile::cache::kafka::certificate::use_internal_ca', {'default_value' => true}),
    String $ssl_cipher_suites          = lookup('profile::cache::kafka::certificate::ssl_cipher_suites', {'default_value' => 'ECDHE-ECDSA-AES256-GCM-SHA384'}),
    String $ssl_curves_list            = lookup('profile::cache::kafka::certificate::ssl_curves_list', {'default_value' => 'P-256'}),
    String $ssl_sigalgs_list           = lookup('profile::cache::kafka::certificate::ssl_sigalgs_list', {'default_value' => 'ECDSA+SHA256'}),
){
    # TLS/SSL configuration
    $ssl_location = '/etc/varnishkafka/ssl'

    $ssl_files = profile::pki::get_cert('kafka', $certificate_name, {
        'outdir'  => $ssl_location,
        'owner'   => 'root',
        'group'   => 'root',
        'profile' => 'kafka_11',
        notify    => Service['varnishkafka-all'],
    })

    $ssl_key_location = $ssl_files['key']
    $ssl_certificate_location = $ssl_files['chained']
    $ssl_key_password = $ssl_key_pass

    if $use_internal_ca {
        $ssl_ca_location = profile::base::certificates::get_trusted_ca_path()
    }
    else {
        $ssl_ca_location_secrets_path = "certificates/${certificate_name}/ca.crt.pem"
        $ssl_ca_location = "${ssl_location}/ca.crt.pem"

        file { $ssl_ca_location:
            content => secret($ssl_ca_location_secrets_path),
            owner   => 'root',
            group   => 'root',
            mode    => '0444',
        }
    }
}
