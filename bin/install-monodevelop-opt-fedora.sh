#!/bin/bash
cd /etc/yum.repos.d/
sudo wget http://download.opensuse.org/repositories/home:tpokorra:mono/Fedora_20/home:tpokorra:mono.repo
sudo yum install monodevelop-opt
