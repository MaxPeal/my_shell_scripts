#!/bin/bash

#http://ftp.unicamp.br/pub/apache/openoffice/4.0.1/binaries/pt-BR/Apache_OpenOffice_4.0.1_Linux_x86-64_install-rpm_pt-BR.tar.gz
#http://ftp.unicamp.br/pub/apache/openoffice/4.0.1/binaries/pt-BR/Apache_OpenOffice_4.0.1_Linux_x86-64_langpack-rpm_pt-BR.tar.gz
#http://ftp.unicamp.br/pub/apache/openoffice/4.0.1/binaries/pt-BR/Apache_OpenOffice_4.0.1_Linux_x86_install-deb_pt-BR.tar.gz
#http://ftp.unicamp.br/pub/apache/openoffice/4.0.1/binaries/pt-BR/Apache_OpenOffice_4.0.1_Linux_x86_install-rpm_pt-BR.tar.gz
#http://ftp.unicamp.br/pub/apache/openoffice/4.0.1/binaries/pt-BR/Apache_OpenOffice_4.0.1_Linux_x86_langpack-deb_pt-BR.tar.gz
#http://ftp.unicamp.br/pub/apache/openoffice/4.0.1/binaries/pt-BR/Apache_OpenOffice_4.0.1_Linux_x86_langpack-rpm_pt-BR.tar.gz

mkdir -p ~/debs/apache-openoffice
cd ~/debs/apache-openoffice
wget -c \
	http://ftp.unicamp.br/pub/apache/openoffice/4.0.1/binaries/pt-BR/Apache_OpenOffice_4.0.1_Linux_x86-64_install-deb_pt-BR.tar.gz \
	http://www.apache.org/dist/openoffice/4.0.1/binaries/pt-BR/Apache_OpenOffice_4.0.1_Linux_x86-64_install-deb_pt-BR.tar.gz.asc \
	http://www.apache.org/dist/openoffice/4.0.1/binaries/pt-BR/Apache_OpenOffice_4.0.1_Linux_x86-64_install-deb_pt-BR.tar.gz.sha256 \
	http://ftp.unicamp.br/pub/apache/openoffice/4.0.1/binaries/pt-BR/Apache_OpenOffice_4.0.1_Linux_x86-64_langpack-deb_pt-BR.tar.gz \
	http://www.apache.org/dist/openoffice/4.0.1/binaries/pt-BR/Apache_OpenOffice_4.0.1_Linux_x86-64_langpack-deb_pt-BR.tar.gz.asc \
	http://www.apache.org/dist/openoffice/4.0.1/binaries/pt-BR/Apache_OpenOffice_4.0.1_Linux_x86-64_langpack-deb_pt-BR.tar.gz.sha256 && \
gpg --verify-files *.asc && \
sha256sum -c *.sha256 && \
tar xzf Apache_OpenOffice_4.0.1_Linux_x86-64_install-deb_pt-BR.tar.gz && \
tar xzf Apache_OpenOffice_4.0.1_Linux_x86-64_langpack-deb_pt-BR.tar.gz && \
find . -type f -regex '^.*\.deb$' -exec sudo dpkg -i '{}' \+
