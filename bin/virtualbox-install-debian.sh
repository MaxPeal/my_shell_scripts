#!/bin/bash

[ -z "$codename" ] && codename="$(lsb_release -cs)"
[ -z "$distname" ] && distname="$(lsb_release -is)"
if [ "$(arch)" = "x86_64" ]; then
    march="amd64"
else
    march="i386"
fi
a="$(echo $1 | cut -d '.' -f 1)"
b="$(echo $1 | cut -d '.' -f 2)"

echo "deb http://download.virtualbox.org/virtualbox/debian/ $codename contrib non-free" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo cp -f virtualbox-${a}.${b}_${1}-${2}~${distname}~${codename}_${march}.deb /var/cache/apt/archives/

sudo apt-key add oracle_vbox.asc
sudo apt-get update
sudo apt-get --yes install virtualbox-${a}.${b}

exit 0
