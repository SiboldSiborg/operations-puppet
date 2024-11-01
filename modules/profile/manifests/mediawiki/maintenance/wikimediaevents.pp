# SPDX-License-Identifier: Apache-2.0
class profile::mediawiki::maintenance::wikimediaevents {
    # calculate per-wiki periodic metrics and let them be pulled by Prometheus (T375508)
    profile::mediawiki::periodic_job { 'wikimediaevents-UpdatePeriodicMetrics-per-wiki':
        command  => '/usr/local/bin/foreachwikiindblist /srv/mediawiki/dblists/all.dblist extensions/WikimediaEvents/maintenance/UpdatePeriodicMetrics.php --verbose',
        interval => '*-*-* 04:40:00',
    }

    # calculate global periodic metrics and let them be pulled by Prometheus (T375508)
    profile::mediawiki::periodic_job { 'wikimediaevents-UpdatePeriodicMetrics-global':
        command  => '/usr/local/bin/mwscript extensions/WikimediaEvents/maintenance/UpdatePeriodicMetrics.php --wiki=metawiki --global-metrics --verbose',
        interval => '*-*-* 04:50:00',
    }
}
