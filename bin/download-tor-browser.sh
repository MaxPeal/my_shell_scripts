#!/bin/bash

help_and_exit ()
{
  echo -e "\n\tUsage: `basename $0` <version>\n"
  exit 0
}

[ -z "$1" ] && help_and_exit

SERVER="https://dist.torproject.org/torbrowser"
[ -n "$2" ] && SERVER="$2"

wget "${SERVER}/${1}/sha256sums-unsigned-build.txt"
wget "${SERVER}/${1}/sha256sums-unsigned-build.txt.asc"
#wget "${SERVER}/${1}/mar-tools-linux64.zip"
#wget "${SERVER}/${1}/mar-tools-linux64.zip.asc"
#wget "${SERVER}/${1}/tor-browser-linux64-${1}_pt-PT.mar"
wget "${SERVER}/${1}/tor-browser-linux64-${1}_pt-PT.tar.xz"
wget "${SERVER}/${1}/tor-browser-linux64-${1}_pt-PT.tar.xz.asc"
#wget "${SERVER}/${1}/tor-browser-linux64-debug.zip"
#wget "${SERVER}/${1}/tor-browser-linux64-debug.zip.asc"
#wget "${SERVER}/${1}/tor-linux64-debug.zip"
#wget "${SERVER}/${1}/tor-linux64-debug.zip.asc"

gpg2 --keyserver x-hkp://pool.sks-keyservers.net --recv-keys 0x4E2C6E8793298290
if [ "$?" != "0" ]; then
    echo -e "\nDOWNLOAD CAN NOT BE VERIFIED!\n"
    exit 1
fi
gpg2 --verify "sha256sums-unsigned-build.txt.asc" "sha256sums-unsigned-build.txt"
if [ "$?" != "0" ]; then
    echo -e "\nDOWNLOAD CAN NOT BE VERIFIED!\n"
    exit 1
fi
gpg2 --verify "tor-browser-linux64-${1}_pt-PT.tar.xz.asc" "tor-browser-linux64-${1}_pt-PT.tar.xz"
if [ "$?" != "0" ]; then
    echo -e "\nDOWNLOAD CAN NOT BE VERIFIED!\n"
    exit 1
fi
#grep "mar-tools-linux64.zip" "sha256sums-unsigned-build.txt" | sha256sum -c
#if [ "$?" != "0" ]; then
#    echo -e "\nDOWNLOAD NOT OK!\n"
#    exit 1
#fi
#grep "tor-browser-linux64-${1}_pt-PT.mar" "sha256sums-unsigned-build.txt" | sha256sum -c
#if [ "$?" != "0" ]; then
#    echo -e "\nDOWNLOAD NOT OK!\n"
#    exit 1
#fi
grep "tor-browser-linux64-${1}_pt-PT.tar.xz" "sha256sums-unsigned-build.txt" | sha256sum -c
if [ "$?" != "0" ]; then
    echo -e "\nDOWNLOAD NOT OK!\n"
    exit 1
fi
#grep "tor-browser-linux64-debug.zip" "sha256sums-unsigned-build.txt" | sha256sum -c
#if [ "$?" != "0" ]; then
#    echo -e "\nDOWNLOAD NOT OK!\n"
#    exit 1
#fi
#grep "tor-linux64-debug.zip" "sha256sums-unsigned-build.txt" | sha256sum -c
#if [ "$?" != "0" ]; then
#    echo -e "\nDOWNLOAD NOT OK!\n"
#    exit 1
#fi

echo -e "\nALL DOWNLOADS OK!\n"
exit 0
