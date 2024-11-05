#! /usr/bin/python3
# SPDX-License-Identifier: Apache-2.0

# The partman recipe used for ganeti creates system partitions and then secondary
# temporary huge swap partition taking up the rest of the software RAID, since
# partman could not convinced to created an unused LVM PV on the second RAID
# group.
# This script handles the conversion into the ganeti VG used by the Ganeti nodes

import subprocess
import os
import sys

if os.geteuid() != 0:
    sys.exit('Needs to be run as root')


def bail_out(msg: str):
    print(msg)
    sys.exit(1)


def ensure_file_is_present(filename: str, msg: str):
    if not os.path.exists(filename):
        bail_out(msg)


def run_cmd(cmd: list, error_msg: str):
    try:
        exec_output = subprocess.check_output(cmd, universal_newlines=True)
    except subprocess.CalledProcessError as e:
        bail_out(error_msg + str(e.returncode))
    return exec_output


def main():
    ensure_file_is_present('/usr/sbin/gnt-cluster', 'This does not appear to be a Ganeti node')
    ensure_file_is_present('/usr/sbin/vgcreate', 'LVM not found')
    ensure_file_is_present('/dev/md2', 'md2 does not exist, wrong Partman recipe was used')

    vg_check_exists = subprocess.run('vgdisplay "ganeti"', check=False, shell=True,
                                     capture_output=True)
    if 'VG UUID' in vg_check_exists.stdout.decode():
        bail_out('ganeti volume group already exists')

    run_cmd(['swapoff', '/dev/md2'], 'Failed to disable the temporary swap partition')
    run_cmd(['pvcreate', '-y', '/dev/md2'], 'Failed to create the physical volume')
    run_cmd(['vgcreate', 'ganeti', '/dev/md2'], 'Failed to create the ganeti volume group')
    run_cmd(['sed', '-i', '/during installation/d', '/etc/fstab'], 'Failed to cleanup /etc/fstab')
    run_cmd(['/usr/bin/sed', '-i', '$d', '/etc/fstab'], 'Failed to cleanup /etc/fstab')

    return "Volume group successfully created"


if __name__ == '__main__':
    print(main())
