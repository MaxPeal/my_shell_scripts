#!/bin/sh

if [ -f ~/.xsessionrc ]; then
    . ~/.xsessionrc
fi

(sleep 0.5; wmsystemtray) &
(sleep 0.5; wmtime -digital) &
(sleep 0.5; wmtimer -b -a) &
(sleep 0.5; wmdiskmon -bl -p /dev/sda1 -p /dev/sda3 -p /dev/sda4) &
#(sleep 1; killall -9 gnome-keyring-daemon >/dev/null 2>&1) &
(sleep 1; thunar --daemon) &
(sleep 1; nm-applet) &
(sleep 2; xsetroot -solid '#2E3436') &
#(sleep 2; nitrogen --restore) &
(sleep 2; compton -b -f -m 0.95) &
#(sleep 3; volti) &
(sleep 3; volumeicon) &
(sleep 3; clipit) &
(sleep 4; dropbox start -i) &
(sleep 4; pamac-tray) &
#(sleep 4; hp-systray -x) &
#(sleep 4; /opt/teamviewer/tv_bin/script/teamviewer) &
#(sleep 4; conkywonky.sh) &
(sleep 5; terminator.wrapper) &
#(sleep 5; killall -9 gnome-keyring-daemon >/dev/null 2>&1) &

exec /usr/bin/wmaker
