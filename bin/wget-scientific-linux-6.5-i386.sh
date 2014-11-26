#!/bin/sh
#URL='http://ftp1.scientificlinux.org/linux/scientific/6.5/i386/iso'
URL='ftp://ftp.gtlib.gatech.edu/pub/scientific/6.5/i386/iso'
#URL='ftp://mirror.lstn.net/scientific/6.5/i386/iso'
mkdir -p ~/Documentos/GNU\ Linux/Scientific\ Linux/6.5-i386-iso
cd ~/Documentos/GNU\ Linux/Scientific\ Linux/6.5-i386-iso
wget -c "${URL}/README"
wget -c "${URL}/SHA256SUM"
wget -c "${URL}/SL-65-i386-2014-02-06-LiveDVD.iso"
exit 0
