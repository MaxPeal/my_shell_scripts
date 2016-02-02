#!/bin/sh

if [ -f ~/.xsessionrc ]; then
    . ~/.xsessionrc
fi

(sleep 1; thunar --daemon) &
(sleep 2; nm-applet) &
(sleep 3; compton -b -f -m 0.95) &
(sleep 3; fbsetroot -solid '#2E3436') &
(sleep 4; conkywonky.sh) &
(sleep 4; killall -9 gnome-keyring-daemon >/dev/null 2>&1) &
(sleep 5; volti) &
(sleep 5; clipit) &
#(sleep 5; hp-systray -x) &
(sleep 5; dropbox.py start -i) &
#(sleep 5; /opt/teamviewer/tv_bin/script/teamviewer) &
(sleep 5; urxvt) &

exec /usr/bin/awesome
