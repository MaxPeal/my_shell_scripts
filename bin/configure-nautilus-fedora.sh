#!/bin/bash

cd /usr/bin
sudo mv -f nautilus                  nautilus.orig
sudo mv -f nautilus-connect-server   nautilus-connect-server.orig
sudo mv -f nautilus-autorun-software nautilus-autorun-software.orig

cd /usr/share/applications
sudo mv -f nautilus.desktop                  nautilus.desktop.orig
sudo mv -f nautilus-classic.desktop          nautilus-classic.desktop.orig
sudo mv -f nautilus-connect-server.desktop   nautilus-connect-server.desktop.orig
sudo mv -f nautilus-autorun-software.desktop nautilus-autorun-software.desktop.orig

exit 0
