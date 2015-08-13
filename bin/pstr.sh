#!/bin/bash

if [ -n "$1" -a -z "$2" ]; then
  gawk -f $HOME/bin/pstr.awk "$1"
else
  echo "Uso: `basename $0` <string a ser protegida>"
fi


