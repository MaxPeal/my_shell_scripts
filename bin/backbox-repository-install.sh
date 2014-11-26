#!/bin/bash

echo 'deb http://ppa.launchpad.net/backbox/three/ubuntu precise main' | \
    sudo tee /etc/apt/sources.list.d/backbox-three.list
echo 'deb-src http://ppa.launchpad.net/backbox/three/ubuntu precise main' | \
    sudo tee -a /etc/apt/sources.list.d/backbox-three.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 78A7ABE1

sudo apt-get update

sudo apt-get --yes install \
    aircrack-ng atshell attest backbox-artwork backbox-default-settings \
    backbox-menu backbox-desktop backfuzz bdaddr beef-project \
    bluediving bss btftp btobex carwhisperer \
    creepy crunch cvechecker dotdotpwn fang \
    fern-wifi-cracker fimap greenplaque hcidump-crash hidattack \
    hstest htexploit httpfs joomscan knock \
    l2cap-headersize-overflow l2cap-packet magictree mdk3 libtftp-perl \
    msf netcmd nmap pack reaver \
    redfang rfcomm-shell rips set slowhttptest \
    spooftooph sqlmap tcpjunk theharvester \
    ubiquity-slideshow-backbox websploit weevely whatweb wifite \
    wirouterkeyrec wpscan zaproxy \
    linux-backports-modules-cw-3.6-3.2.0-38-generic \
    linux-backports-modules-hv-3.2.0-38-generic \
    linux-backports-modules-net-3.2.0-38-generic \
    linux-headers-lbm-3.2.0-38-generic

if [ "$(uname -m)" = "x86_64" ]
then
    sudo dpkg -i updates-modules-3.2.0-38-generic-di_3.2.0-38.25backbox1_amd64.udeb
else
    sudo dpkg -i updates-modules-3.2.0-38-generic-di_3.2.0-38.25backbox1_i386.udeb
fi
