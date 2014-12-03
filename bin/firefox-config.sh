#!/bin/bash
sudo update-alternatives \
    --install "/usr/bin/x-www-browser" "x-www-browser" /home/joaomanoel/.local/firefox/firefox 100
sudo update-alternatives \
    --set "x-www-browser" /home/joaomanoel/.local/firefox/firefox
