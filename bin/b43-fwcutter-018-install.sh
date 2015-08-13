#!/bin/sh -e
#wget http://bues.ch/b43/fwcutter/b43-fwcutter-018.tar.bz2 http://bues.ch/b43/fwcutter/b43-fwcutter-018.tar.bz2.asc
#gpg2 --verify b43-fwcutter-018.tar.bz2.asc
tar xjf b43-fwcutter-018.tar.bz2
cd b43-fwcutter-018
make
sudo make install
cd ..
rm -rf b43-fwcutter-018
exit 0
