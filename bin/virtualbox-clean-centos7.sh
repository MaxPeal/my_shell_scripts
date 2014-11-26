#!/bin/bash

rm -f virtualbox.repo
rm -f oracle_vbox.asc
rm -f Oracle_VM_VirtualBox_Extension_Pack-${1}-${2}.vbox-extpack
rm -f SDKRef.pdf
rm -f SHA256SUMS
rm -f UserManual.pdf
rm -f VBoxGuestAdditions_${1}.iso
rm -f VirtualBoxSDK-${1}-${2}.zip
rm -f VirtualBox-${1}.tar.bz2
rm -f VirtualBox-$(echo ${1} | cut -d '.' -f 1-2)-${1}_${2}_el7-1.x86_64.rpm

exit 0
