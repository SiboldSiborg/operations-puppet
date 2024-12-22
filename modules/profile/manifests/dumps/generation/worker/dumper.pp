# SPDX-License-Identifier: Apache-2.0
# this class is for snapshot hosts that run regular dumps
# meaning sql/xml dumps every couple of weeks or so
class profile::dumps::generation::worker::dumper(
    Wmflib::Ensure $ensure = lookup('profile::dumps::generation::worker::dumper::ensure', default_value => present),
    $runtype = lookup('profile::dumps::generation::worker::dumper::runtype'),
    $maxjobs = lookup('profile::dumps::generation::worker::dumper::maxjobs'),
) {
    class { 'snapshot::dumps::systemdjobs':
        ensure  => $ensure,
        user    => 'dumpsgen',
        maxjobs => $maxjobs,
        runtype => $runtype,
    }
}
