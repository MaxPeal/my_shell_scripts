#!/bin/bash

for i in $@; do
  [ "$i" == "*.bash" ] && break
  sed -e 's/#!\/bin\/bash/#!\/bin\/sh/' -i $i
  mv -f $i `basename $i .bash`.sh
done


