#!/usr/bin/env bash
# original script found at: http://goo.gl/mukEu
# modified for joaomanoel7@gmail.com
apt-get -y update
apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.tar.bz2
tar xjf ruby-1.9.3-rc1.tar.bz2
cd ruby-1.9.3-rc1/
./configure --prefix=/usr/local
make
make install
