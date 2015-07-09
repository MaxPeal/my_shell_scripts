#!/bin/bash
set -e

# elrepo
echo -e "\nINSTALL ELREPO REPOSITORY ...\n"
sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
sudo rpm -ivh --force http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

# epel
echo -e "\nINSTALL EPEL REPOSITORY ...\n"
sudo rpm --import http://mirror.globo.com/epel/RPM-GPG-KEY-EPEL-7
sudo rpm -ivh --force http://mirror.globo.com/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm

# li.nux.ro
echo -e "\nINSTALL NUX-DEXTOP REPOSITORY ...\n"
sudo rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
sudo rpm -ivh --force http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-3.el7.nux.noarch.rpm

# adobe
echo -e "\nINSTALL ADOBE REPOSITORY ...\n"
sudo rpm -ivh --force http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux

# virtualbox
echo -e "\nINSTALL VIRTUALBOX REPOSITORY ...\n"
sudo rpm --import http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc
wget -q http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo -O- | sudo tee /etc/yum.repos.d/virtualbox.repo

# tor
echo -e "\nINSTALL TOR REPOSITORY ...\n"
sudo rpm --import http://deb.torproject.org/torproject.org/rpm/RPM-GPG-KEY-torproject.org.asc
cat <<EOF | sudo tee /etc/yum.repos.d/tor.repo
[tor]
name=Tor repo
enabled=1
baseurl=http://deb.torproject.org/torproject.org/rpm/el/7/\$basearch/
gpgcheck=1
gpgkey=http://deb.torproject.org/torproject.org/rpm/RPM-GPG-KEY-torproject.org.asc

[tor-source]
name=Tor source repo
enabled=1
autorefresh=0
baseurl=http://deb.torproject.org/torproject.org/rpm/el/7/SRPMS
gpgcheck=1
gpgkey=http://deb.torproject.org/torproject.org/rpm/RPM-GPG-KEY-torproject.org.asc
EOF
sudo sed -i '/^\[epel\]/,/^gpgkey/ {
/^gpgkey/ {
a\
exclude=tor
}
}' /etc/yum.repos.d/epel.repo
sudo sed -i '/^\[epel-source\]/,/^gpgkey/ {
/^gpgkey/ {
a\
exclude=tor
}
}' /etc/yum.repos.d/epel.repo
sudo sed -i '/^\[epel-debuginfo\]/,/^gpgkey/ {
/^gpgkey/ {
a\
exclude=tor-debuginfo
}
}' /etc/yum.repos.d/epel.repo

# create cache
echo -e "\nCREATE CACHE FOR REPOSITORIES ...\n"
sudo yum makecache

exit 0
