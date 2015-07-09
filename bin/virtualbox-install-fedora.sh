#!/bin/bash

VERSION="4.3.16"
RELEASE="95972"
FEDORA="fedora18-1"
test -n "$1" && VERSION="$1"
test -n "$2" && RELEASE="$2"
test -n "$3" && FEDORA="$3"
A="`echo -en "$VERSION" | cut -d '.' -f 1`"
B="`echo -en "$VERSION" | cut -d '.' -f 2`"

mkdir -p ~/src/virtualbox
cd ~/src/virtualbox

rm -f oracle_vbox.asc
wget http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc || exit 1
sudo rpm --import oracle_vbox.asc || exit 1

rm -f virtualbox.repo
wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo || exit 1
sudo cp -f virtualbox.repo /etc/yum.repos.d/ || exit 1
sudo yum makecache || exit 1

rm -f VirtualBox-${A}.${B}-${VERSION}_${RELEASE}_${FEDORA}.x86_64.rpm
wget http://download.virtualbox.org/virtualbox/${VERSION}/VirtualBox-${A}.${B}-${VERSION}_${RELEASE}_${FEDORA}.x86_64.rpm || exit 1
rpm --checksig VirtualBox-${A}.${B}-${VERSION}_${RELEASE}_${FEDORA}.x86_64.rpm || exit 1
sudo yum install ./VirtualBox-${A}.${B}-${VERSION}_${RELEASE}_${FEDORA}.x86_64.rpm -y || exit 1

rm -f MD5SUMS
rm -f Oracle_VM_VirtualBox_Extension_Pack-${VERSION}-${RELEASE}.vbox-extpack
rm -f SDKRef.pdf
rm -f SHA256SUMS
rm -f UserManual.pdf
rm -f VBoxGuestAdditions_${VERSION}.iso
rm -f VirtualBoxSDK-${VERSION}-${RELEASE}.zip
rm -f VirtualBox-${VERSION}.tar.bz2

wget http://download.virtualbox.org/virtualbox/${VERSION}/MD5SUMS
wget http://download.virtualbox.org/virtualbox/${VERSION}/Oracle_VM_VirtualBox_Extension_Pack-${VERSION}-${RELEASE}.vbox-extpack
wget http://download.virtualbox.org/virtualbox/${VERSION}/SDKRef.pdf
wget http://download.virtualbox.org/virtualbox/${VERSION}/SHA256SUMS
wget http://download.virtualbox.org/virtualbox/${VERSION}/UserManual.pdf
wget http://download.virtualbox.org/virtualbox/${VERSION}/VBoxGuestAdditions_${VERSION}.iso
wget http://download.virtualbox.org/virtualbox/${VERSION}/VirtualBoxSDK-${VERSION}-${RELEASE}.zip
wget http://download.virtualbox.org/virtualbox/${VERSION}/VirtualBox-${VERSION}.tar.bz2

exit 0
