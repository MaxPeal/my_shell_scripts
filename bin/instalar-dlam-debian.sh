#!/bin/bash

# install dependencies
sudo apt-get --yes install \
    git python-virtualenv libffi-dev libboost-python-dev libboost-system-dev \
    libboost-thread-dev librtmp-dev unrar \
    libiconv-hook-dev libgeoip-dev libcrypto++-dev libssl-dev libsslcommon2-dev \
    build-essential make gcc-4.7 gcc-4.7-base gcc-4.7-doc \
    gcc-4.7-locales gcc-4.7-multilib gcc-4.7-plugin-dev gcc-4.7-source g++-4.7 \
    g++-4.7-multilib m4 m4-doc autoconf autoconf2.13 \
    autoconf2.64 autoconf-dickey autoconf-gl-macros autoconf2.59 autoconf-archive \
    autoconf-doc autotools-dev automake automake1.10 automake1.4 \
    automake1.9 automake1.9-doc python-libtorrent libtorrent-rasterbar-dev libtorrent-rasterbar-doc

# build and install libtorrent-rasterbar-0.16.12
#mkdir -p ~/dev/libtorrent
#cd ~/dev/libtorrent
#if [ ! -f "libtorrent-rasterbar-0.16.12.tar.gz" ]; then
#	wget https://libtorrent.googlecode.com/files/libtorrent-rasterbar-0.16.12.tar.gz
#elif [ "cd326fd2609c3d00c25dabdd441a0704efbf0207" != "`sha1sum libtorrent-rasterbar-0.16.12.tar.gz | cut -d ' ' -f 1`" ]; then
#	rm -f libtorrent-rasterbar-0.16.12.tar.gz
#	wget https://libtorrent.googlecode.com/files/libtorrent-rasterbar-0.16.12.tar.gz
#fi
#rm -rf libtorrent-rasterbar-0.16.12
#tar xzf libtorrent-rasterbar-0.16.12.tar.gz
#cd libtorrent-rasterbar-0.16.12
#./configure --enable-python-binding --enable-shared --enable-static --enable-tests --enable-examples --prefix=/usr
#make clean
#make -j8
#sudo make install
#cd ..

# build and install dlam
mkdir -p ~/dev
cd ~/dev
virtualenv dlam
cd dlam
source bin/activate
ln -s /usr/lib/python2.7/dist-packages/libtorrent.so "$(pwd)/lib/python2.7/site-packages"
ln -s /usr/lib/python2.7/dist-packages/PyV8-1.0_dev.egg-info "$(pwd)/lib/python2.7/site-packages"
ln -s /usr/lib/python2.7/dist-packages/PyV8.py "$(pwd)/lib/python2.7/site-packages"
ln -s /usr/lib/python2.7/dist-packages/PyV8.pyc "$(pwd)/lib/python2.7/site-packages"
./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstal --requirement=~/bin/requirements-dlam.txt
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall cython
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall git+git://github.com/surfly/gevent@1.0rc2
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall requests
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall bsdiff4
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall pycrypto
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall crypto
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall pillow
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall pil
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall beautifulsoup4
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall python-dateutil
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall bottle
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall git+https://github.com/abourget/gevent-socketio
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall chardet
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall cchardet
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall keyring
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall cffi
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall git+https://github.com/nietschy/pylibrtmp.git
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall pytz
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall netaddr
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall mega.py
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall dnspython
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall PyYAML
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall dulwich
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall lxml
#./bin/pip-2.7 install --install-option="--prefix=$(pwd)" --upgrade --force-reinstall git+https://github.com/nietschy/libmagic.git
git clone https://github.com/downloadam/client.git
