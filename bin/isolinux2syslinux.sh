#!/bin/bash

function usage()
{
  echo -e $1
  exit $2
}

if [ "$1" == "-h" -o "$1" == "--help" ]; then
  [ -z "$2" ] && \
    usage "\n  usage: $0 <full_path/isolinux.cfg>\n" 0
  usage "\n  usage: $0 <full_path/isolinux.cfg>\n" -1
fi

[ -z "$1" -o -n "$2" ] && \
  usage "\n  usage: $0 <full_path/isolinux.cfg>\n" -2

[ "`basename $1`" != "isolinux.cfg" ] && \
  usage "\n  usage: $0 <full_path/isolinux.cfg>\n" -3

[ ! -w "`dirname $1`" ] && \
  chmod --quiet +w "`dirname $1`"
[ ! -w "`dirname $1`" ] && \
  usage "\n  ERROR: YOU DO NOT HAVE PERMISSION TO WRITE IN \"`dirname $1`\"!\n" -4

save_pwd="`pwd`"
cd `dirname $1`

[ ! -f "isolinux.cfg" ] && \
  usage "\n  ERROR: \"isolinux.cfg\" NOT EXIST OR IS NOT A REGULAR FILE!\n" -5

[ "`file isolinux.cfg | awk '{ print $2 }'`" == "empty" ] && \
  usage "\n  ERROR: FILE \"isolinux.cfg\" IS EMPTY!\n" -6

[ ! -w "isolinux.cfg" ] && \
  chmod --quiet +w "isolinux.cfg"
[ ! -w "isolinux.cfg" ] && \
  usage "\n  ERROR: YOU DO NOT HAVE PERMISSION TO WRITE IN \"isolinux.cfg\"!\n" -7

rm -f syslinux.cfg
touch syslinux.cfg
toix isolinux.cfg

IFS=$'\n'
let c=0

for i in `cat isolinux.cfg`; do

  cmd="`echo $i | awk '{ print $1 }'`"

  if [ "$cmd" == "append" ]; then

    cmd1="`echo $i | awk -F 'append' '{ print $1 }'`"
    echo -n "$cmd1" >> syslinux.cfg
    echo -n "append" >> syslinux.cfg
    cmd2="`echo $i | awk -F 'append' '{ print $2 }'`"

    if [ "$c" == "0" -o "$c" == "1" ]; then

      echo -n " noprompt cdrom-detect/try-usb=true persistent" >> syslinux.cfg
      let c++

    elif [ "$c" == "2" ]; then

      echo -n " noprompt" >> syslinux.cfg
      let c++

    fi

    echo "$cmd2" >> syslinux.cfg

  else

    echo "$i" >> syslinux.cfg

  fi

done

toms syslinux.cfg

cd $save_pwd
