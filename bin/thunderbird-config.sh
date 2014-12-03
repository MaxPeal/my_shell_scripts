#!/bin/bash
sudo update-alternatives \
    --install "/usr/bin/x-mail-reader" "x-mail-reader" /home/joaomanoel/.local/thunderbird/thunderbird 100
sudo update-alternatives \
    --set "x-mail-reader" /home/joaomanoel/.local/thunderbird/thunderbird
