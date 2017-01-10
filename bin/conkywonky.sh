#!/bin/sh
# conkywonky
# ----------
# Many moons ago, Conky did not automatically restart when changes were
# made to its config files. This script was used to restart it. It does not
# really serve any purpose now, but I like the name and some people may still
# be using/referencing it.

if [ "$(pidof conky)" ]; then
    killall -9 conky
fi

test -f ~/.conky/music.conkyrc    && conky -q -c ~/.conky/music.conkyrc
test -f ~/.conky/hardware.conkyrc && conky -q -c ~/.conky/hardware.conkyrc
test -f ~/.conky/system.conkyrc   && conky -q -c ~/.conky/system.conkyrc
#test -f ~/.conky/weather.conkyrc  && conky -q -c ~/.conky/weather.conkyrc
test -f ~/.conky/JC.conkyrc       && conky -q -c ~/.conky/JC.conkyrc

exit 0
