#!/bin/sh

if [ -f ~/.xsessionrc ]; then
    . ~/.xsessionrc
fi

conkywonky.sh &
compton -b -f -m 0.95 &
nitrogen --restore &
volumeicon &
clipit &
nm-applet &
#/opt/teamviewer/tv_bin/script/teamviewer &
#hp-systray -x &
/bin/sh -c 'sleep 5; dropbox.py start -i' &
/bin/sh -c 'sleep 5; killall -9 gnome-keyring-daemon >/dev/null 2>&1' &
#nautilus --no-default-window --no-desktop &
urxvt &

exec /usr/bin/i3
