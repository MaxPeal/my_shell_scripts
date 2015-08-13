#!/bin/bash
cd ~/games/urban-terror/UrbanTerror42/
for i in `find . -type f`; do
    cd "`dirname $i`"
    grep "`basename $i`" ~/games/urban-terror/UrbanTerror42.md5 | md5sum -c -
    cd ~/games/urban-terror/UrbanTerror42/
done
exit 0
