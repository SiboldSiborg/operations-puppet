#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
#
# Validate if the passed IP address is found in the firewall
# config for either nftables or ferm (depending on what the
# server is running

if [ -f "/etc/nftables/input/10_ganeti_ssh_cluster.nft" ]; then
    grep  $1 /etc/nftables/input/10_ganeti_ssh_cluster.nft
fi

if [ -f "/etc/ferm/conf.d/10_ganeti_ssh_cluster" ]; then
    grep  $1 /etc/ferm/conf.d/10_ganeti_ssh_cluster
fi
