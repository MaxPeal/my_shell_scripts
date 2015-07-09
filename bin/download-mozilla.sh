#!/bin/bash

help_and_exit ()
{
  echo -e "\n\tUsage: `basename $0` <firefox|thunderbird|xulrunner> <version>\n"
  exit 0
}

[ -z "$2" ] && help_and_exit
[ "$1" != "firefox" -a "$1" != "thunderbird" -a "$1" != "xulrunner" ] && help_and_exit

SERVER="http://download.cdn.mozilla.net/pub/mozilla.org/${1}/releases"
#SERVER=http://ftp.acc.umu.se/mirror/mozilla/${1}/releases
#SERVER=http://ftp.heanet.ie/mirrors/ftp.mozilla.org/pub/mozilla.org/${1}/releases
#SERVER=http://mozilla.mirror.ac.za/${1}/releases
[ -n "$3" ] && SERVER="$3"

wget "${SERVER}/${2}/KEY"
wget "${SERVER}/${2}/SHA1SUMS"
wget "${SERVER}/${2}/SHA1SUMS.asc"
if [ "$1" = "firefox" -o "$1" = "thunderbird" ]; then
    wget "${SERVER}/${2}/linux-x86_64/pt-BR/${1}-${2}.tar.bz2"
else
    wget "${SERVER}/${2}/runtimes/${1}-${2}.en-US.linux-x86_64.tar.bz2"
    wget "${SERVER}/${2}/sdk/${1}-${2}.en-US.linux-x86_64.sdk.tar.bz2"
    wget "${SERVER}/${2}/sdk/${1}-${2}.en-US.linux-x86_64.sdk.tar.bz2.asc"
    wget "${SERVER}/${2}/source/${1}-${2}.source.tar.bz2"
fi

gpg2 --import -a KEY
if [ "$?" != "0" ]; then
    echo -e "\nDOWNLOAD CAN NOT BE VERIFIED!\n"
    exit 1
fi
gpg2 --verify SHA1SUMS.asc SHA1SUMS
if [ "$?" != "0" ]; then
    echo -e "\nDOWNLOAD CAN NOT BE VERIFIED!\n"
    exit 1
fi

if [ "$1" = "firefox" -o "$1" = "thunderbird" ]; then
    if [ "$(grep ${1}-${2}.tar.bz2 SHA1SUMS | grep 'linux-x86_64/pt-BR' | cut -d ' ' -f 1)" != "$(sha1sum ${1}-${2}.tar.bz2 | cut -d ' ' -f 1)" ]; then
        echo -e "\nDOWNLOAD NOT OK!\n"
        exit 1
    fi
else
    egrep "runtimes/${1}-${2}.en-US.linux-x86_64.tar.bz2$" SHA1SUMS | sed 's,runtimes/,,' | sha1sum -c
    if [ "$?" != "0" ]; then
        echo -e "\nDOWNLOAD NOT OK!\n"
        exit 1
    fi
    egrep "sdk/${1}-${2}.en-US.linux-x86_64.sdk.tar.bz2$" SHA1SUMS | sed 's,sdk/,,' | sha1sum -c
    if [ "$?" != "0" ]; then
        echo -e "\nDOWNLOAD NOT OK!\n"
        exit 1
    fi
    egrep "sdk/${1}-${2}.en-US.linux-x86_64.sdk.tar.bz2.asc$" SHA1SUMS | sed 's,sdk/,,' | sha1sum -c
    if [ "$?" != "0" ]; then
        echo -e "\nDOWNLOAD NOT OK!\n"
        exit 1
    fi
    egrep "source/${1}-${2}.source.tar.bz2$" SHA1SUMS | sed 's,source/,,' | sha1sum -c
    if [ "$?" != "0" ]; then
        echo -e "\nDOWNLOAD NOT OK!\n"
        exit 1
    fi
    gpg2 --verify "${1}-${2}.en-US.linux-x86_64.sdk.tar.bz2.asc" "${1}-${2}.en-US.linux-x86_64.sdk.tar.bz2"
    if [ "$?" != "0" ]; then
        echo -e "\nDOWNLOAD NOT OK!\n"
        exit 1
    fi
fi

echo -e "\nALL DOWNLOADS OK!\n"
exit 0
