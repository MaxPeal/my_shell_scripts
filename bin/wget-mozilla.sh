#!/bin/bash

help_and_exit ()
{
  echo -e "\n\tUsage: `basename $0` <firefox | thunderbird> <version>\n"
  exit 0
}

[ -z "${2}" ] && help_and_exit
[ "${1}" != "firefox" -a "${1}" != "thunderbird" ] && help_and_exit

SERVER=http://download.cdn.mozilla.net/pub/mozilla.org/${1}/releases
#SERVER=http://ftp.acc.umu.se/mirror/mozilla/${1}/releases
#SERVER=http://ftp.heanet.ie/mirrors/ftp.mozilla.org/pub/mozilla.org/${1}/releases
#SERVER=http://mozilla.mirror.ac.za/${1}/releases
[ -n "${3}" ] && SERVER="${3}"

wget ${SERVER}/${2}/KEY
wget ${SERVER}/${2}/SHA1SUMS
wget ${SERVER}/${2}/SHA1SUMS.asc
wget ${SERVER}/${2}/linux-x86_64/pt-BR/${1}-${2}.tar.bz2

gpg --import -a KEY || exit 1
gpg --verify SHA1SUMS.asc SHA1SUMS || exit 1

if [ "$(grep ${1}-${2}.tar.bz2 SHA1SUMS | grep 'linux-x86_64/pt-BR' | cut -d ' ' -f 1)" = "$(sha1sum ${1}-${2}.tar.bz2 | cut -d ' ' -f 1)" ]; then
  echo "DOWNLOAD OK"
  exit 0
fi

echo "DOWNLOAD NOT OK"
exit 1
