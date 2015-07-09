#!/bin/bash

mkdir -p ~/src/mensageiros/chatzilla
cd ~/src/mensageiros/chatzilla

hg clone http://hg.mozilla.org/chatzilla chatzilla-ro
curl -o xrmakeM.diff.txt http://chatzilla.rdmsoft.com/xulrunner/patch/xrmakeM.diff.txt

cp -af chatzilla-ro a
ln -s a b

patch -p0 < xrmakeM.diff.txt
cd a/xpi
./makexpi.py

exit 0
