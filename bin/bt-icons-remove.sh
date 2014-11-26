#!/bin/bash

sudo rm -f /usr/shar/icons/bt{,5}menu.png
sudo rm -rf /usr/share/icons/bt-icons/gnome/

for i in /usr/share/icons/gnome/{16x16,22x22,24x24,32x32}; do
	sudo update-alternatives --remove start-here.svg $i/places/ubuntu-logo.png
	sudo rm -f $i/places/ubuntu-logo.png
done

sudo update-alternatives --remove start-here.svg /usr/share/icons/gnome/scalable/places/ubuntu-logo.svg
sudo rm -f /usr/share/icons/gnome/scalable/places/ubuntu-logo.svg
sudo update-alternatives --set start-here.svg /usr/share/icons/gnome/scalable/places/gnome-foot.svg

# edit menus and use /usr/share/icons/gnome/48x48/stock/generic/stock_keyring.png to icon-dir-menus
# and icon of the 'install backtrack'

for k in "Humanity-Dark" "Humanity "; do
	for i in 16 22 24 32 48 64; do
		for j in distributor-logo.svg gnome-main-menu.svg novell-button.svg start-here.svg; do
		    sudo rm -f "/usr/share/icons/${k}/places/${i}/${j}"
		    sudo cp -f "/usr/share/icons/gnome/scalable/places/gnome-foot.svg" \
			"/usr/share/icons/${k}/places/${i}/${j}"
		    sudo rm -f "/usr/share/icons/bt-icons/${k}/places/${i}/${j}"
		    sudo cp -f "/usr/share/icons/gnome/scalable/places/gnome-foot.svg" \
			"/usr/share/icons/bt-icons/${k}/places/${i}/${j}"
		done
	done
done
