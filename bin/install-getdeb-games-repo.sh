#!/bin/bash
echo 'deb http://archive.getdeb.net/ubuntu trusty-getdeb apps' | sudo tee /etc/apt/sources.list.d/getdeb.list
echo 'deb-src http://archive.getdeb.net/ubuntu trusty-getdeb apps' | sudo tee -a /etc/apt/sources.list.d/getdeb.list
echo 'deb http://archive.getdeb.net/ubuntu trusty-getdeb games' | sudo tee -a /etc/apt/sources.list.d/getdeb.list
echo 'deb-src http://archive.getdeb.net/ubuntu trusty-getdeb games' | sudo tee -a /etc/apt/sources.list.d/getdeb.list
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo apt-get update
exit 0
