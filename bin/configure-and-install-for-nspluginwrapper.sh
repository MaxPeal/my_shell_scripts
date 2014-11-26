#!/bin/bash
sudo apt-get install \
	libcurl3 \
	libcurl3-gnutls \
	libcurl3-nss \
	libcurl4-doc \
	libcurl4-nss-dev \
	libnss3 \
	libnss3-1d \
	libnss3-dev \
	libnss3-tools \
	libnss-cache \
	libnss-db \
	libnss-ldap \
	libnss-mdns \
	libnss-pgsql2 \
	libnss-winbind \
	libnss-extrausers \
	libnss-myhostname \
	libnss-rainbow2 \
	libnss-gw-name \
	libnss-lwres \
	libnss-mysql-bg \
	libnss-sss \
	libcurl3 \
	libcurl3-gnutls \
	libcurl3-nss \
	libcurl4-doc \
	libcurlpp0 \
	libcurlpp-dev \
	libcurl4-gnutls-dev \
	libgnutls26 \
	libgnutls28 \
	libgnutls28-dev \
	libgnutls-openssl27 \
	libgnutls-xssl0 \
	libgnutlsxx27 \
	libgnutlsxx28 \
	libidn11-dev \
	libkrb5-dev \
	libldap2-dev \
	libssh2-1-dev \
	libc6-dev \
	libbsd-dev \
	freebsd-glue \
	freebsd-buildutils \
	freebsd-manpages \
	freebsd-mk \
	db5.3-doc \
	libc6-dev-i386 \
	gcc-multilib \
	curlftpfs
rm -rf nspluginwrapper-1.4.4
tar xzf nspluginwrapper-1.4.4.tar.gz
cd nspluginwrapper-1.4.4
CFLAGS=-I/usr/include/x86_64-linux-gnu LDFLAGS=-L/usr/lib/x86_64-linux-gnu -lgthread-2.0 -ldl ./configure --target-os=linux --target-cpu=x86_64
make clean
make
sudo make install
cd ..
sudo /usr/lib/nspluginwrapper/x86_64/linux/npconfig -n -i /usr/lib/mozilla/plugins/flashplugin-alternative.so
exit 0
