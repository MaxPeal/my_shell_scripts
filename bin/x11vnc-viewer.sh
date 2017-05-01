#!/bin/sh

help_message() {
    echo -e "Usage:\n\t$(basename $0) HOST PORT PROXY_HOST PROXY_PORT"
}

if [ "$1" = "--help" -o "$1" = "-h" ]; then
    help_message
    exit  0
fi

if [ -z "$4" -o -n "$5" ]; then
    echo "Error usage!"
    help_message
    exit 1
fi

if [ -z "$JAVA_HOME" ]; then
    export JAVA_HOME="/usr/local/java/default"
fi

if [ -z "$VNCVIEWER_JAR" ]; then
    if [ -f /usr/share/vnc/classes/VncViewer.jar ]; then
        export VNCVIEWER_JAR='/usr/share/vnc/classes/VncViewer.jar'
    elif [ -f /usr/share/vnc-java/vncviewer.jar ]; then
        export VNCVIEWER_JAR='/usr/share/vnc-java/vncviewer.jar'
    fi
fi

exec "$JAVA_HOME/bin/java" -cp "$VNCVIEWER_JAR" VncViewer HOST "$1" PORT "$2" forceProxy yes proxyHost "$3" proxyPort "$4"
