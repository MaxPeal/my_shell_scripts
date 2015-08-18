#!/bin/bash
test -z "$1" && exit 1
test -z "`echo $1 | egrep '^([1-9][0-9]{0,2}\.){1,3}[1-9][0-9]{0,2}$'`" && exit 2
exec java -cp /usr/share/x11vnc/classes/ssl/VncViewer.jar VncViewer HOST $1 PORT 56100 forceProxy yes proxyPort 8118 proxyHost 127.0.0.1
