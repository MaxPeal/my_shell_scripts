#!/bin/bash

export FEDORA_DISTRO_DIR=$HOME/dev/fedora/fedora-chroot
mkdir -p $FEDORA_DISTRO_DIR/var/lib/rpm

sudo apt-get --yes install yum rpm python-m2crypto

sudo rpm --root $FEDORA_DISTRO_DIR --initdb

sudo wget -O /tmp/fedora-release-19-2.noarch.rpm \
	ftp://ftp.las.ic.unicamp.br/pub/fedora/linux/releases/19/Fedora/x86_64/os/Packages/f/fedora-release-19-2.noarch.rpm
sudo rpm -ivh --force-debian --nodeps --root $FEDORA_DISTRO_DIR /tmp/fedora-release-19-2.noarch.rpm

sudo wget -O /tmp/fedora-release-notes-19-0.13.noarch.rpm \
	ftp://ftp.las.ic.unicamp.br/pub/fedora/linux/releases/19/Fedora/x86_64/os/Packages/f/fedora-release-notes-19-0.13.noarch.rpm
sudo rpm -ivh --force-debian --nodeps --root $FEDORA_DISTRO_DIR /tmp/fedora-release-notes-19-0.13.noarch.rpm

sudo rm -f /tmp/*.rpm

sudo yum -y --installroot $FEDORA_DISTRO_DIR install yum
sudo rm -rf /etc/pki
sudo ln -fs $FEDORA_DISTRO_DIR/etc/pki /etc/pki
sudo yum -y --installroot $FEDORA_DISTRO_DIR install yum

sudo yum -y --installroot $FEDORA_DISTRO_DIR install \
	vim less wget man man-pages iputils bash bash-completion
