#!/bin/bash

if [ -n "${1}" -a -z "${2}" ]; then
  gawk -f $HOME/bin/extname.awk "${1}"
else
  echo "usage: `basename $0` <file>"
fi


