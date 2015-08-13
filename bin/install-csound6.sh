#!/bin/bash

mkdir -p ~/dev/csound
cd ~/dev/csound

rm -rf Csound6.01
if [ ! -f Csound6.01.tar.gz ]; then
	wget http://ufpr.dl.sourceforge.net/project/csound/csound6/Csound6.01/Csound6.01.tar.gz || exit 1
elif [ "9a99b5c98b8e0ab28bdb006e2253dc5931d78a20" != "$(sha1sum Csound6.01.tar.gz | cut -d ' ' -f 1)" ]; then
	rm -f Csound6.01.tar.gz
	wget http://ufpr.dl.sourceforge.net/project/csound/csound6/Csound6.01/Csound6.01.tar.gz || exit 1
fi
if [ ! -f README_Version_6.01.md ]; then
	wget http://ufpr.dl.sourceforge.net/project/csound/csound6/Csound6.01/README_Version_6.01.md || exit 1
elif [ "dad2c3735b61b2f13930d5ee5dff1f01fb715ae0" != "$(sha1sum README_Version_6.01.md | cut -d ' ' -f 1)" ]; then
	rm -f README_Version_6.01.md
	wget http://ufpr.dl.sourceforge.net/project/csound/csound6/Csound6.01/README_Version_6.01.md || exit 1
fi
tar xzf Csound6.01.tar.gz
cd Csound6.01
mkdir -p build
cd build
cmake 	-DBUILD_STATIC_LIBRARY=ON \
	-DBUILD_WINSOUND=ON \
	-DBUILD_PD_CLASS=ON \
	-DPD_HEADER_PATH=/usr/include/pdextended \
	-DCMAKE_INSTALL_PREFIX=/usr .. && \
	make -j4 && \
	sudo make install
