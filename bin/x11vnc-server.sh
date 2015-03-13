#!/bin/bash

stop() {
    if [ -f ~/.vnc/x11vnc.pid ]; then
        ( kill -9 `cat ~/.vnc/x11vnc.pid`; rm -f ~/.vnc/x11vnc.pid )
    fi
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
        -httpdir /usr/share/vnc-java/ \
        -httpport 57100 \
        -rfbport 56100
}

if [ "${1}" = "start" ]; then
    stop
    sleep 0.5
    start
elif [ "${1}" = "stop" ]; then
    stop
else
    echo -e "usage:\t`basename ${0}`\tstart|stop"
    exit 1
fi

exit 0
