#!/bin/bash

# uninstall lamp and mysql-workbench
sudo apt-get --yes purge \
    cb-meta-lamp \
    mysql-workbench \
    mysql-workbench-data \
    '^apache.*$' \
    '^mysql.*$' \
    '^php.*$'
sudo apt-get --yes --purge autoremove
sudo apt-get clean

# unconfigure apache
sudo find /var/ -name "*apache*" -exec sudo rm -rf {} \;
sudo find /run/ -name "*apache*" -exec sudo rm -rf {} \;
sudo find /etc/ -name "*apache*" -exec sudo rm -rf {} \;

# unconfigure mysql
sudo find /var/ -name "*[Mm][Yy][Ss][Qq][Ll]*" -exec sudo rm -rf {} \;
sudo find /run/ -name "*[Mm][Yy][Ss][Qq][Ll]*" -exec sudo rm -rf {} \;
sudo find /etc/ -name "*[Mm][Yy][Ss][Qq][Ll]*" -exec sudo rm -rf {} \;

# unconfigure php
sudo find /var/ -name "*php*" -exec sudo rm -rf {} \;
sudo find /run/ -name "*php*" -exec sudo rm -rf {} \;
sudo find /etc/ -name "*php*" -exec sudo rm -rf {} \;
sudo rm -rf /usr/share/php*

exit 0
