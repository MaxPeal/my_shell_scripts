#!/bin/bash


# *** INSTALL DEPENDENCIES ***
sudo apt-get --yes install \
    scons scons-doc git git-svn subversion \
    subversion-tools systemtap-sdt-dev systemtap systemtap-client \
    systemtap-common systemtap-doc systemtap-grapher systemtap-runtime python-setupdocs \
    python-setuptools python-all python-all-dev python2.6 python2.6-dev \
    python2.6-doc python2.6-examples python2.6-minimal python2.7 python2.7-dev \
    python2.7-doc python2.7-examples python2.7-minimal dpkg-dev build-essential


# *** INSTALL BOOST 1.49.0 FROM DEBIAN REPOSITORY ***
sudo apt-get --yes install \
    libboost1.49-all-dev libboost-graph1.49-dev libboost-mpi-python1.49-dev libboost-signals1.49-dev \
    libboost1.49-dbg libboost-graph-dev libboost-mpi-python-dev libboost-signals-dev libboost1.49-dev \
    libboost-graph-parallel1.49.0 libboost-program-options1.49.0 libboost-system1.49.0 libboost1.49-doc libboost-graph-parallel1.49-dev \
    libboost-program-options1.49-dev libboost-system1.49-dev libboost-all-dev libboost-graph-parallel-dev libboost-program-options-dev \
    libboost-system-dev libboost-chrono1.49.0 libboost-iostreams1.49.0 libboost-python1.49.0 libboost-test1.49.0 \
    libboost-chrono1.49-dev libboost-iostreams1.49-dev libboost-python1.49-dev libboost-test1.49-dev libboost-chrono-dev \
    libboost-iostreams-dev libboost-python-dev libboost-test-dev libboost-date-time1.49.0 libboost-locale1.49.0 \
    libboost-random1.49.0 libboost-thread1.49.0 libboost-date-time1.49-dev libboost-locale1.49-dev libboost-random1.49-dev \
    libboost-thread1.49-dev libboost-date-time-dev libboost-locale-dev libboost-random-dev libboost-thread-dev \
    libboost-dbg libboost-math1.49.0 libboost-regex1.49.0 libboost-timer1.49.0 libboost-dev \
    libboost-math1.49-dev libboost-regex1.49-dev libboost-timer1.49-dev libboost-doc libboost-math-dev \
    libboost-regex-dev libboost-timer-dev libboost-filesystem1.49.0 libboost-mpi1.49.0 libboost-serialization1.49.0 \
    libboost-wave1.49.0 libboost-filesystem1.49-dev libboost-mpi1.49-dev libboost-serialization1.49-dev libboost-wave1.49-dev \
    libboost-filesystem-dev libboost-mpi-dev libboost-serialization-dev libboost-wave-dev libboost-graph1.49.0 \
    libboost-mpi-python1.49.0 libboost-signals1.49.0


# *** BUILD BOOST 1.55.0 FROM SOURCE ***
#mkdir -p $HOME/dev/boost
#cd $HOME/dev/boost
#if [ !-f "boost_1_55_0.7z" ]; then
#	wget http://ufpr.dl.sourceforge.net/project/boost/boost/1.55.0/boost_1_55_0.7z
#elif [ "09203c60118442561d0ee196772058d80226762d" != "`sha1sum boost_1_55_0.7z | cut -d ' ' -f 1`" ]; then
#	rm -f boost_1_55_0.7z
#	wget http://ufpr.dl.sourceforge.net/project/boost/boost/1.55.0/boost_1_55_0.7z
#fi
#7z x boost_1_55_0.7z
#./bootstrap.sh --prefix=/usr/local/boost_1_55_0
#./bjam --clean
#./bjam cxxflags=-fPIC
#sudo ./b2 install


# *** BUILD PYV8 ***
mkdir -p $HOME/dev
cd $HOME/dev
if [ -d "pyv8/.svn" ]; then
	cd pyv8
	svn cleanup || exit 1
	svn update || exit 1
else
	rm -rf pyv8
	svn checkout http://pyv8.googlecode.com/svn/trunk/ pyv8 || exit 1
	cd pyv8
fi
if [ -d "build/v8/.svn" ]; then
	cd build/v8
	svn cleanup || exit 1
	svn update || exit 1
	cd ../..
else
	mkdir -p build
	rm -rf build/v8
	svn checkout http://v8.googlecode.com/svn/trunk/ build/v8 || exit 1
fi
if [ -d "debian/.git" ]; then
	cd debian
	git pull || exit 1
	cd ..
else
	rm -rf debian
	git clone https://github.com/andete/pyv8-debian.git debian || exit 1
fi

dpkg-buildpackage && \
rm -rf $HOME/debs/pyv8 && \
mkdir -p $HOME/debs/pyv8 && \
mv ../*.deb $HOME/debs/pyv8 && \
mv ../pyv8_* $HOME/debs/pyv8 && \
sudo dpkg -i $HOME/debs/pyv8/*.deb
sudo apt-get -f install

#CFLAGS=-fPIC \
#CXXFLAGS=-fPIC \
#DEBUG=1 \
#BOOST_HOME=$HOME/dev/boost/boost_1_55_0 \
#INCLUDE=/usr/local/boost_1_55_0/include \
#LIB=/usr/local/boost_1_55_0/lib \
#python2.7 setup.py build && \
#sudo python2.7 setup.py install


# *** END ***
exit 0
