#!/bin/bash
echo "deb http://deb.torproject.org/torproject.org ${codename:-wheezy} main" | sudo tee /etc/apt/sources.list.d/tor.list
echo "deb-src http://deb.torproject.org/torproject.org ${codename:-wheezy} main" | sudo tee -a /etc/apt/sources.list.d/tor.list
gpg --keyserver keys.gnupg.net --recv 886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
sudo apt-get update
sudo apt-get --yes install \
	tor \
	tor-dbg \
	tor-geoipdb \
	vidalia \
	deb.torproject.org-keyring \
	obfsproxy \
	python-pyptlib \
	privoxy \
	torsocks
