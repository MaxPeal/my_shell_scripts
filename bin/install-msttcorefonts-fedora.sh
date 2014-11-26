#!/bin/sh
# install microsoft core fonts on fedora

sudo yum -y install rpm-build cabextract
mkdir -p ~/src/msttcorefonts
cd ~/src/msttcorefonts
wget http://corefonts.sourceforge.net/msttcorefonts-2.5-1.spec
sed 's/--timeout=5/--timeout=30/' -i msttcorefonts-2.5-1.spec
rpmbuild -bb ./msttcorefonts-2.0-1.spec
sudo yum -y --nogpgcheck localinstall \
	$HOME/src/rpmbuild/RPMS/noarch/msttcorefonts-2.5-1.noarch.rpm

exit 0
