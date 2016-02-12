#!/bin/sh

if [ -f ~/.xsessionrc ]; then
    . ~/.xsessionrc
fi

(sleep 1; killall -9 gnome-keyring-daemon >/dev/null 2>&1) &
(sleep 1; thunar --daemon) &
(sleep 1; nm-applet) &
(sleep 2; fbsetroot -solid '#2E3436') &
(sleep 3; compton -b -f -m 0.95) &
(sleep 4; conkywonky.sh) &
(sleep 5; volti) &
(sleep 5; clipit) &
#(sleep 5; hp-systray -x) &
(sleep 5; dropbox.py start -i) &
#(sleep 5; /opt/teamviewer/tv_bin/script/teamviewer) &
(sleep 6; i3-sensible-terminal) &
(sleep 6; killall -9 gnome-keyring-daemon >/dev/null 2>&1) &

exec /usr/bin/i3-with-shmlog
