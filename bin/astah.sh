#!/bin/sh
JAVA_HOME="/usr/lib/jvm/default-runtime"
ASTAH_HOME="$HOME/.local/astah_professional"
exec "$JAVA_HOME/bin/java" -jar "$ASTAH_HOME/astah-pro.jar" "$@"
