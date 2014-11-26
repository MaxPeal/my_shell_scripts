#!/bin/bash

stop() {
    test -f ~/.vnc/x11vnc.pid && \
        ( kill -9 `cat ~/.vnc/x11vnc.pid`; rm -f ~/.vnc/x11vnc.pid )
}

start () {
    cd ~
    exec x11vnc \
        -http_ssl \
        -ssl SAVE \
        -env SSL_INIT_TIMEOUT=300 \
        -ssltimeout 360000 \
        -display :0 \
        -forever \
        -usepw \
        -rmflag create:/home/joaomanoel/.vnc/x11vnc.pid \
        -httpdir /usr/share/x11vnc/classes/ssl/ \
        -httpport 57100 \
        -rfbport 56100
}

if [ "X${1}X" = "XstartX" ]; then
    stop
    sleep 0.5
    start
elif [ "X${1}X" = "XstopX" ]; then
    stop
else
    echo -e "usage:\t`basename ${0}`\tstart|stop"
    exit 1
fi

exit 0
