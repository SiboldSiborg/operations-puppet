# SPDX-License-Identifier: Apache-2.0
# == Class: profile::cache::haproxykafka
#
# Deploy haproxykafka instance with configuration and relative
# auxiliary files
#
class profile::cache::haproxykafka(
    Wmflib::Ensure $ensure                        = lookup('profile::cache::haproxykafka::ensure'),
    String $kafka_cluster_name                    = lookup('profile::cache::haproxykafka::kafka_cluster_name'),
    Integer $workers                              = lookup('profile::cache::haproxykafka::workers'),
    Float $message_buffer                         = lookup('profile::cache::haproxykafka::message_buffer'),
    String $sdid                                  = lookup('profile::cache::haproxykafka::sdid'),
    Haproxykafka::Socket $socket                  = lookup('profile::cache::haproxykafka::socket'),
    Haproxykafka::Logparser $logparser            = lookup('profile::cache::haproxykafka::logparser'),
    Haproxykafka::Kafka $kafka                    = lookup('profile::cache::haproxykafka::kafka'),
    Haproxykafka::Monitoring $monitoring          = lookup('profile::cache::haproxykafka::monitoring'),
    Haproxykafka::Transformrules $transform_rules = lookup('profile::cache::haproxykafka::transform_rules'),
) {

    $kafka_cluster_cfg = kafka_config($kafka_cluster_name)
    $bootstrap_servers = {
        'rdkafka' => {
            'bootstrap.servers' => $kafka_cluster_cfg['brokers']['ssl_string']
        }
    }

    $config = {
        workers         => $workers,
        message_buffer  => $message_buffer,
        sdid            => $sdid,
        socket          => $socket,
        logparser       => $logparser,
        kafka           => deep_merge($kafka, $bootstrap_servers),
        monitoring      => $monitoring,
        transform_rules => $transform_rules,
    }

    class { 'haproxykafka':
        ensure => $ensure,
        config => $config,
    }
}
