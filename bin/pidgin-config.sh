#!/bin/bash
sudo update-alternatives \
    --install "/usr/bin/x-instant-messenger" "x-instant-messenger" /usr/bin/pidgin 100
sudo update-alternatives \
    --set "x-instant-messenger" /usr/bin/pidgin
