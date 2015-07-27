#!/bin/sh
compton -b -f -m 0.95 &
#nitrogen --restore &
#tint2 -c ~/.config/tint2/openbox.tint2rc &
#volumeicon &
/bin/sh -c 'sleep 5; killall -9 gnome-keyring-daemon 2>&1 /dev/null' &
#/bin/sh -c 'sleep 5; killall -9 gpg-agent 2>&1 /dev/null; gpg-agent --daemon --sh' &
#/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
thunar --daemon &
guake &
