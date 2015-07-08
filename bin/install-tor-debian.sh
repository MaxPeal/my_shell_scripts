#!/bin/bash
echo "deb http://deb.torproject.org/torproject.org ${codename:-jessie} main" | sudo tee /etc/apt/sources.list.d/tor.list
echo "deb-src http://deb.torproject.org/torproject.org ${codename:-jessie} main" | sudo tee -a /etc/apt/sources.list.d/tor.list
cat | sudo tee /etc/apt/preferences.d/tor.pref <<EOF
Package: tor tor-dbg tor-geoipdb
Pin: origin deb.torproject.org
Pin-Priority: 1001
EOF
gpg2 --keyserver keys.gnupg.net --recv 886DDD89
gpg2 --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
sudo apt-get update
sudo apt-get --yes install \
    tor \
    deb.torproject.org-keyring \
    tor-geoipdb \
    tor-dbg \
    polipo \
    python-pyptlib \
    python-torctl \
    obfs4proxy \
    obfsproxy \
    torsocks
