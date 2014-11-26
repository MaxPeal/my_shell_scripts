#!/bin/bash
exec openbox-xdgmenu /etc/xdg/xdg-backbox/menus/xfce-applications.menu | sed 's/sh -c/x-terminal-emulator -e sh -c/'
