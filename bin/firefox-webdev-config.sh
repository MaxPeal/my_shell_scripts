#!/bin/bash
sudo update-alternatives \
    --install "/usr/bin/x-www-browser" "x-www-browser" /home/joaomanoel/.local/firefox-webdev/firefox 90
sudo update-alternatives \
    --set "x-www-browser" /home/joaomanoel/.local/firefox-webdev/firefox
