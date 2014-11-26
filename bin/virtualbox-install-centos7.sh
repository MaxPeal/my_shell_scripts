#!/bin/bash
set -e

sudo rpm --import oracle_vbox.asc
sudo cp -f virtualbox.repo /etc/yum.repos.d/
sudo yum makecache
rpm --checksig VirtualBox-$(echo ${1} | cut -d '.' -f 1-2)-${1}_${2}_el7-1.x86_64.rpm
sudo yum --assumeyes install ./VirtualBox-$(echo ${1} | cut -d '.' -f 1-2)-${1}_${2}_el7-1.x86_64.rpm

exit 0
