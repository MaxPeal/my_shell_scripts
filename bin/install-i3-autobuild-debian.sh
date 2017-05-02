#!/bin/sh -e

/usr/lib/apt/apt-helper download-file http://dl.bintray.com/i3/i3-autobuild/pool/main/i/i3-autobuild-keyring/i3-autobuild-keyring_2016.10.01_all.deb keyring.deb SHA256:460e8c7f67a6ae7c3996cc8a5915548fe2fee9637b1653353ec62b954978d844
sudo dpkg -i ./keyring.deb

echo 'deb http://dl.bintray.com/i3/i3-autobuild sid main' | sudo tee /etc/apt/sources.list.d/i3-autobuild.list

sudo tee /etc/apt/preferences.d/00-i3-autobuild.pref <<EOF
Package: i3*
Pin: origin "dl.bintray.com"
Pin-Priority: 1001
EOF

sudo apt update
sudo apt install -y i3

exit 0
