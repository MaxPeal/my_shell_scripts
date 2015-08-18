#!/bin/bash
echo 'deb http://emacs.naquadah.org/ stable/' | sudo tee /etc/apt/sources.list.d/emacs.list
echo 'deb-src http://emacs.naquadah.org/ stable/' | sudo tee -a /etc/apt/sources.list.d/emacs.list
wget -q -O - http://emacs.naquadah.org/key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install \
	emacs-snapshot \
	emacs-snapshot-common \
	emacs-snapshot-bin-common \
	emacs-snapshot-el \
	emacs-snapshot-gtk
#	emacs-snapshot-nox
#	emacs-snapshot-lucid
#	emacs-snapshot-dbg
