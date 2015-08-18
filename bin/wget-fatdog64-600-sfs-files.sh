#!/bin/bash

wget -c ftp://distro.ibiblio.org/fatdog/sfs/600/32bit-slacko-1.sfs.md5sum.txt
wget -c ftp://distro.ibiblio.org/fatdog/sfs/600/fd64-devx_630rc2.sfs.md5sum.txt
wget -c ftp://distro.ibiblio.org/fatdog/sfs/600/fpc-2.6.0-x86_64.sfs.md5sum.txt
wget -c ftp://distro.ibiblio.org/fatdog/sfs/600/gambas3-3.3.3-610.sfs.md5sum.txt
wget -c ftp://distro.ibiblio.org/fatdog/sfs/600/google-chrome-29.0.1.547.65.sfs.md5sum.txt
wget -c ftp://distro.ibiblio.org/fatdog/sfs/600/iron-19.1100.0-x86_64.sfs.md5sum.txt
wget -c ftp://distro.ibiblio.org/fatdog/sfs/600/kernel-source-3.12.6.sfs.md5sum.txt
wget -c ftp://distro.ibiblio.org/fatdog/sfs/600/lives-1.6.1.sfs.md5sum.txt
wget -c ftp://distro.ibiblio.org/fatdog/sfs/600/manpages.sfs.md5sum.txt
wget -c ftp://distro.ibiblio.org/fatdog/sfs/600/openshot-1.4.3-610.sfs.md5sum.txt
wget -c ftp://distro.ibiblio.org/fatdog/sfs/600/wine-1.5.4-i486.sfs.md5sum.txt
wget -c ftp://distro.ibiblio.org/fatdog/sfs/600/sfslist
wget -c ftp://distro.ibiblio.org/fatdog/sfs/600/update-sfslist

wget-ibiblio.sh \
    ftp://distro.ibiblio.org/fatdog/sfs/600/32bit-slacko-1.sfs \
    ftp://distro.ibiblio.org/fatdog/sfs/600/fd64-devx_630rc2.sfs \
    ftp://distro.ibiblio.org/fatdog/sfs/600/fpc-2.6.0-x86_64.sfs \
    ftp://distro.ibiblio.org/fatdog/sfs/600/gambas3-3.3.3-610.sfs \
    ftp://distro.ibiblio.org/fatdog/sfs/600/google-chrome-29.0.1.547.65.sfs \
    ftp://distro.ibiblio.org/fatdog/sfs/600/iron-19.1100.0-x86_64.sfs \
    ftp://distro.ibiblio.org/fatdog/sfs/600/kernel-source-3.12.6.sfs \
    ftp://distro.ibiblio.org/fatdog/sfs/600/lives-1.6.1.sfs \
    ftp://distro.ibiblio.org/fatdog/sfs/600/manpages.sfs \
    ftp://distro.ibiblio.org/fatdog/sfs/600/openshot-1.4.3-610.sfs \
    ftp://distro.ibiblio.org/fatdog/sfs/600/wine-1.5.4-i486.sfs

exit 0
