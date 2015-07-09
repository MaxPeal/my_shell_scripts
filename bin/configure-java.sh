#!/bin/bash

test ! -x "$1/bin/java" && \
    ( echo "usage: `basename $0` <full path to jdk/jre dir>"; exit 1 )

cat >>$HOME/.bashrc <<EOF

# Java
export JAVA_HOME="$1"
export PATH="\$JAVA_HOME/bin:\$PATH"
EOF

export JAVA_HOME="$1"
export PATH="$JAVA_HOME/bin:$PATH"

mkdir -p $HOME/.mozilla/plugins
cd $HOME/.mozilla/plugins

if [ -f "$JAVA_HOME/lib/amd64/libnpjp2.so" ]; then
	ln -f -s $JAVA_HOME/lib/amd64/libnpjp2.so .
elif [ -f "$JAVA_HOME/jre/lib/amd64/libnpjp2.so" ]; then
	ln -f -s $JAVA_HOME/jre/lib/amd64/libnpjp2.so .
elif [ -f "$JAVA_HOME/lib/i386/libnpjp2.so" ]; then
	ln -f -s $JAVA_HOME/lib/i386/libnpjp2.so .
elif [ -f "$JAVA_HOME/jre/lib/i386/libnpjp2.so" ]; then
	ln -f -s $JAVA_HOME/jre/lib/i386/libnpjp2.so .
fi

