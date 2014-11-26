#!/bin/bash

if [ "$1" = "/dev/cdrom" ]
then
    /usr/bin/vlc vcd:///dev/cdrom && exit 0
elif [ "$1" = "/dev/dvd" ]
then
    /usr/bin/vlc dvd:///dev/dvd && exit 0
fi

exit -1
