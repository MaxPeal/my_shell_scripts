#!/bin/bash


# *** INSTALL DEPENDENCIES ***
sudo apt-get --yes install \
    python-setupdocs python-setuptools cython gevent bsdiff \
    python-crypto python-crypto-doc python-beautifulsoup python-dateutil python-bottle \
    python-bottle-doc python-netaddr python-netaddr-docs python-dnspython python-yaml \
    python-dulwich python-lxml python-lxml-doc python-imaging \
    python-imaging-doc python-imaging-doc-html python-imaging-doc-pdf python-imaging-sane python-imaging-tk
    #python-libtorrent 
$HOME/bin/instalar-pyv8-ubuntu.sh


# *** UPGRADE DEPENDENCIES ***
sudo pip-2.7 uninstall --yes pil
sudo rm -rf /tmp/pip*
sudo pip-2.7 install --upgrade setuptools
for i in \
	cython gevent requests bsdiff4 \
	pycrypto pillow beautifulsoup4 python-dateutil bottle \
	gevent-socketio cffi python-librtmp netaddr dnspython \
	pyyaml dulwich lxml cchardet libmagic chardet keyring
do
	sudo rm -rf /tmp/pip*
	sudo pip-2.7 install --force-reinstall --upgrade $i
done


# *** CLONE DOWNLOAD.AM CLIENT ***
mkdir -p $HOME/dev
cd $HOME/dev
if [ -d "downloadam-client/.git" ]; then
	cd downloadam-client
	git pull || exit 1
else
	rm -rf downloadam-client
	git clone https://github.com/downloadam/client.git downloadam-client || exit 1
	cd downloadam-client
fi


# *** END ***
exit 0
