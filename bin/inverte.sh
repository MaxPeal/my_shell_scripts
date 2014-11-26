#!/bin/bash

if [ -n "$1" -a -z "$2" ]; then
  gawk -f $HOME/bin/inverte.awk "$1"
else
  echo "Uso: `basename $0` <sequencia a ser invertida>"
fi


