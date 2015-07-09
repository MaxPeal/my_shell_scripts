#!/bin/bash


# *** INSTALL DEPENDENCIES ***

$HOME/bin/instalar-pyv8-fedora.sh
rpm -i ftp://rpmfind.net/linux/rpmfusion/free/fedora/releases/19/Everything/x86_64/os/librtmp-2.4-0.3.20110811gitc58cfb3e.fc19.x86_64.rpm
rpm -i ftp://rpmfind.net/linux/rpmfusion/free/fedora/development/rawhide/x86_64/os/librtmp-devel-2.4-0.3.20110811gitc58cfb3e.fc19.x86_64.rpm
mkdir -p ~/dev
git clone https://github.com/nietschy/pylibrtmp.git ~/dev/pylibrtmp
cd  ~/dev/pylibrtmp
python2.7 setup.py build && \
python2.7 setup.py install

# *** UPGRADE DEPENDENCIES ***

for i in \
	cython gevent requests bsdiff4 \
	pycrypto pil beautifulsoup4 python-dateutil bottle \
	gevent-socketio cffi python-librtmp netaddr dnspython \
	pyyaml dulwich lxml cchardet libmagic chardet keyring
do
	pip-python install --force-reinstall --upgrade $i
done


# *** CLONE DOWNLOAD.AM CLIENT ***

mkdir -p $HOME/dev
cd $HOME/dev

if [ -d "downloadam-client/.git" ]; then
	cd downloadam-client
	git pull || exit 1
	cd ..
else
	rm -rf downloadam-client
	git clone https://github.com/downloadam/client.git downloadam-client || exit 1
fi


# *** END ***

exit 0
