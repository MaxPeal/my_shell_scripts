#!/bin/bash

if [ -n "$2" -o -z "$1" -o "$1" == "--help" -o "$1" == "-h" ]; then
  echo -e "\n  usage: $0 file.sh\n"
  exit -1
fi

if [ "`basename $1`" == "`basename $1 .sh`" ]; then
  echo -e "\n  usage: $0 file.sh\n"
  exit -1
fi

if [ ! -f "$1" ]; then
  echo -e "\n  ERROR: FILE \"$1\" NOT EXIST OR IS NOT A REGULAR FILE!\n"
  exit -1
fi

save_pwd="`pwd`"
cd `dirname $1`

sed -e 's/#!\/bin\/sh/#!\/bin\/bash/' `basename $1` > `basename $1 .sh`.bash
chmod +x `basename $1` `basename $1 .sh`.bash

cd $save_pwd
