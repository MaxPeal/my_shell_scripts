#!/bin/bash


# *** IINSTALL DEPENDENCIES ***
yum --assumeyes install \
	git git-svn subversion subversion-tools mercurial \
	scons systemtap-sdt-devel boost-devel python-devel \
	gcc gcc-c++ make python-pip python-setupdocs python-setuptools \
	python-setuptools_trial python-setuptools_git python-setuptools_hg \
	tar bzip2 unzip zip p7zip p7zip-plugins arj unarj \
	tcl-devel tk-devel zlib-devel freetype-devel lcms2-devel \
	libtiff-devel libwebp-devel openjpeg-devel lcms-devel \
	libjpeg-turbo-devel libffi-devel gnutls-devel libyaml-devel \
	libxml2-devel libxslt-devel file file-devel rb_libtorrent-python \
	tkinter tcl tk rb_libtorrent-devel


# *** BUILD BOOST 1.55.0 FROM SOURCE ***
#mkdir -p $HOME/dev/boost
#cd $HOME/dev/boost
#if [ !-f "boost_1_55_0.7z" ]; then
#	wget http://ufpr.dl.sourceforge.net/project/boost/boost/1.55.0/boost_1_55_0.7z
#elif [ "09203c60118442561d0ee196772058d80226762d" != "`sha1sum boost_1_55_0.7z | cut -d ' ' -f 1`" ]; then
#	rm -f boost_1_55_0.7z
#	wget http://ufpr.dl.sourceforge.net/project/boost/boost/1.55.0/boost_1_55_0.7z
#fi
#7z x boost_1_55_0.7z && cd boost_1_55_0
#./bootstrap.sh --prefix=/usr/local/boost_1_55_0
#./bjam --clean
#./bjam cxxflags=-fPIC
#./b2 install


# *** BUILD PYV8 ***
mkdir -p $HOME/dev
cd $HOME/dev

if [ -d "pyv8/.svn" ]; then
	cd pyv8
	svn cleanup || exit 1
	svn update || exit 1
	cd ..
else
	rm -rf pyv8
	svn checkout http://pyv8.googlecode.com/svn/trunk/ pyv8 || exit 1
fi

mkdir -p pyv8/build
cd pyv8/build

if [ -d "v8/.svn" ]; then
	cd v8
	svn cleanup || exit 1
	svn update || exit 1
	cd ..
else
	rm -rf v8
	svn checkout http://v8.googlecode.com/svn/trunk/ v8 || exit 1
fi

cd ..

#BOOST_HOME=$HOME/dev/boost/boost_1_55_0 \
#INCLUDE=/usr/local/boost_1_55_0/include \
#LIB=/usr/local/boost_1_55_0/lib \
python2.7 setup.py build && \
python2.7 setup.py install


# *** END ***
exit 0
