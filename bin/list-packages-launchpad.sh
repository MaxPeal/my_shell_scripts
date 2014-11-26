#!/bin/bash

cat $1 | grep -e 'all.deb' -e 'amd64.deb' | cut -d '_' -f 1 | list-packages-back.sh -
