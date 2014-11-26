#!/bin/bash

if [ -d "$1" ]
then
    rootdir="$1"
else
    rootdir="."
fi

find "$rootdir" -name "*.deb" -exec basename '{}' .deb \; | cut -d '_' -f 1 | xargs sudo dpkg -P
