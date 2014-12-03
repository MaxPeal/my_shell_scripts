#!/bin/bash
sudo update-alternatives \
    --install "/usr/bin/x-instant-messenger" "x-instant-messenger" /home/joaomanoel/.local/instantbird/instantbird 90
sudo update-alternatives \
    --set "x-instant-messenger" /home/joaomanoel/.local/instantbird/instantbird
