#!/bin/bash
sudo update-alternatives --install "/usr/bin/gnome-www-browser" "gnome-www-browser" ~/.local/firefox/firefox 100
sudo update-alternatives --set     "gnome-www-browser"                              ~/.local/firefox/firefox
sudo update-alternatives --install "/usr/bin/x-www-browser"     "x-www-browser"     ~/.local/firefox/firefox 100
sudo update-alternatives --set     "x-www-browser"                                  ~/.local/firefox/firefox
