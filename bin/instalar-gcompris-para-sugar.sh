#!/bin/bash

# Install dependencies
sudo apt-get --yes install \
	libgtk2.0-dev libgstreamer0.10-dev libgstreamer-plugins-bad0.10-dev libgstreamer-plugins-base0.10-dev libsqlite3-dev \
	libsqlite0-dev librsvg2-dev libxml2-dev python-dev python2.7-dev \
	python-gtk2-dev python-gobject-2-dev python-gobject-dev python-cairo-dev \
	gnucap gnuchess gnuchess-book make gcc \
	intltool libglib2.0-dev libgconf2-dev libgee-dev libdbus-glib-1-dev \
	libpango1.0-dev cmake cmake-curses-gui cmake-data cmake-doc

# create source directory
mkdir -p ~/dev/sugar/gcompris

# Build Polyol
cd ~/dev/sugar/gcompris
if [ ! -f "polyol-1.3.tar.gz" ]; then
	wget "https://obs.sugarlabs.org/public/source/SweetsDistribution:0.94/polyol/polyol-1.3.tar.gz" || exit 1
elif [ "07d61a44a90469ca3c1419b83e3e3e840090d58d" != "`sha1sum polyol-1.3.tar.gz | cut -d ' ' -f 1`" ]; then
	rm -f polyol-1.3.tar.gz
	wget "https://obs.sugarlabs.org/public/source/SweetsDistribution:0.94/polyol/polyol-1.3.tar.gz" || exit 1
fi
tar xpf polyol-1.3.tar.gz
cd polyol-1.3
cmake -DCMAKE_INSTALL_PREFIX=$HOME/Activities/gcompris.activity && make && make install

# Build GCompris
cd ~/dev/sugar/gcompris
if [ ! -f "gcompris-12.11.tar.bz2" ]; then
	wget "http://gcompris.net/download/gcompris-12.11.tar.bz2" || exit 1
elif [ "cca586b5de850b476821e50faad571a4883db36a" != "`sha1sum gcompris-12.11.tar.bz2 | cut -d ' ' -f 1`" ]; then
	rm -f gcompris-12.11.tar.bz2
	wget "http://gcompris.net/download/gcompris-12.11.tar.bz2" || exit 1
fi
tar xpf gcompris-12.11.tar.bz2
cd gcompris-12.11
if [ ! -f "gc.patch" ]; then
	wget 'http://git.sugarlabs.org/alsroot/gcompris/commit/38918f0c78bfea26dd5b4fe809dead9a52acecc7?format=patch' -O gc.patch || exit 1
elif [ "21741534ce88b9c062d0afcc22fb064b73170648" != "`sha1sum gc.patch | cut -d ' ' -f 1`" ]; then
	rm -f gc.patch
	wget 'http://git.sugarlabs.org/alsroot/gcompris/commit/38918f0c78bfea26dd5b4fe809dead9a52acecc7?format=patch' -O gc.patch || exit 1
fi
patch -f -p1 < gc.patch
./configure PKG_CONFIG_PATH=$HOME/Activities/gcompris.activity/lib/pkgconfig --prefix=$HOME/Activities/gcompris.activity --enable-sugar --enable-sqlite && make && make install

# Link activity directory
cd ~/Activities/gcompris.activity
ln -s share/sugar/activities/GCompris.activity/activity .

# END
exit 0
