#!/bin/bash

if [ ! -d "$HOME/src/virtualbox" ]; then
    echo "\n\a\tNao existem arquivos de dados do VirtualBox!\n"
    exit 0
fi

[ -z "$codename" ] && codename="$(lsb_release -cs)"
[ -z "$distname" ] && distname="$(lsb_release -is)"
if [ "$(arch)" = "x86_64" ]; then
    march="amd64"
else
    march="i386"
fi
a="$(echo $1 | cut -d '.' -f 1)"
b="$(echo $1 | cut -d '.' -f 2)"

cd ~/src/virtualbox/
rm -f oracle_vbox.asc
rm -f MD5SUMS
rm -f Oracle_VM_VirtualBox_Extension_Pack-${1}-${2}.vbox-extpack
rm -f SDKRef.pdf
rm -f UserManual.pdf
rm -f VBoxGuestAdditions_${1}.iso
rm -f VirtualBoxSDK-${1}-${2}.zip
rm -f virtualbox-${a}.${b}_${1}-${2}~${distname}~${codename}_${march}.deb

exit 0
