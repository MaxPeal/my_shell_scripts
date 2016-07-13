#!/bin/sh

if [ -f ~/.xsessionrc ]; then
    . ~/.xsessionrc
fi

#(sleep 0.5; gnome-keyring-daemon --components=ssh,secrets,pkcs11) &
(sleep 0.5; xsetroot -solid '#2E3436') &
#(sleep 0.5; xsetbg -fullscreeb -onroot ~/.background) &
(sleep 0.5; compton -b -f -m 0.95) &
(sleep 1; thunar --daemon) &
(sleep 1; nm-applet) &
#(sleep 2; volti) &
(sleep 2; volumeicon) &
(sleep 2; clipit) &
(sleep 3; dropbox start -i) &
#(sleep 3; pamac-tray) &
#(sleep 4; hp-systray -x) &
#(sleep 4; /opt/teamviewer/tv_bin/script/teamviewer) &
(sleep 5; conkywonky.sh) &
(sleep 5; i3-sensible-terminal) &
(sleep 5; killall -9 gnome-keyring-daemon >/dev/null 2>&1) &

exec /usr/bin/i3-with-shmlog
