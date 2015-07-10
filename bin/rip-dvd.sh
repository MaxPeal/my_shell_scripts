#!/bin/bash

[ -z "$1" ] && exit -1

mkdir -p -m 0750 $HOME/dvdrip-data/$1/avi/001 && \
mkdir -p -m 0750 $HOME/dvdrip-data/$1/tmp && \
mkdir -p -m 0750 $HOME/dvdrip-data/$1/vob/001 && \
rm -f /home/jmanoel/dvdrip-data/$1/vob/001//$1-???.vob && \
execflow -n 19 tccat -t dvd -T 1,-1,1 -i \/dev\/sr0 | \
dvdrip-splitpipe -f $HOME/dvdrip-data/$1/tmp/$1-001-nav.log 1024 $HOME/dvdrip-data/$1/vob/001//$1 vob  | \
tcextract -a 3 -x ac3 -t vob | \
tcdecode -x ac3 | \
tcscan -x pcm && \
echo EXECFLOW_OK
