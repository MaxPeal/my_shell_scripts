#!/bin/bash

cd /usr/bin
sudo mv -f nautilus.orig                  nautilus
sudo mv -f nautilus-connect-server.orig   nautilus-connect-server
sudo mv -f nautilus-autorun-software.orig nautilus-autorun-software

cd /usr/share/applications
sudo mv -f nautilus.desktop.orig                  nautilus.desktop
sudo mv -f nautilus-classic.desktop.orig          nautilus-classic.desktop
sudo mv -f nautilus-connect-server.desktop.orig   nautilus-connect-server.desktop
sudo mv -f nautilus-autorun-software.desktop.orig nautilus-autorun-software.desktop

exit 0
