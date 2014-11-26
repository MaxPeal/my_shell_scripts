#!/bin/bash

wget -c http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
wget -c http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc
wget -c http://download.virtualbox.org/virtualbox/${1}/Oracle_VM_VirtualBox_Extension_Pack-${1}-${2}.vbox-extpack
wget -c http://download.virtualbox.org/virtualbox/${1}/SDKRef.pdf
wget -c http://download.virtualbox.org/virtualbox/${1}/SHA256SUMS
wget -c http://download.virtualbox.org/virtualbox/${1}/UserManual.pdf
wget -c http://download.virtualbox.org/virtualbox/${1}/VBoxGuestAdditions_${1}.iso
wget -c http://download.virtualbox.org/virtualbox/${1}/VirtualBoxSDK-${1}-${2}.zip
wget -c http://download.virtualbox.org/virtualbox/${1}/VirtualBox-${1}.tar.bz2
wget -c http://download.virtualbox.org/virtualbox/${1}/VirtualBox-$(echo ${1} | cut -d '.' -f 1-2)-${1}_${2}_el7-1.x86_64.rpm

exit 0
