#!/bin/sh
#URL='http://ftp1.scientificlinux.org/linux/scientific/7rolling/x86_64/iso'
#URL='ftp://ftp.gtlib.gatech.edu/pub/scientific/7rolling/x86_64/iso'
URL='ftp://mirror.lstn.net/scientific/7rolling/x86_64/iso'
mkdir -p ~/Documentos/GNU\ Linux/Scientific\ Linux/7rolling-x86_64-iso
cd ~/Documentos/GNU\ Linux/Scientific\ Linux/7rolling-x86_64-iso
wget -c "${URL}/SL-7-x86_64-CHECKSUM"
wget -c "${URL}/SL-7-x86_64-netinst.iso"
wget -c "${URL}/SL-7-x86_64-DVD.iso"
exit 0
