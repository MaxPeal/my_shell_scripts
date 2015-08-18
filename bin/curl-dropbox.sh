#!/bin/sh
curl -o dropbox_2015.02.12_amd64.deb --location \
    'https://linux.dropbox.com/packages/ubuntu/dropbox_2015.02.12_amd64.deb'
curl -o dropbox.py --location \
    'https://www.dropbox.com/download?dl=packages/dropbox.py'
curl -o nautilus-dropbox-1.4.0.tar.bz2 --location \
    'https://www.dropbox.com/download?dl=packages/nautilus-dropbox-1.4.0.tar.bz2'
exit 0
