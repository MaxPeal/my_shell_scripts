#!/bin/sh

# Variaveis de ambiente do transmission
# $TR_APP_VERSION
# $TR_TIME_LOCALTIME
# $TR_TORRENT_DIR
# $TR_TORRENT_HASH
# $TR_TORRENT_ID
# $TR_TORRENT_NAME

# URL to Transmission RPC Interface (usually http://HOST:9091/transmission/rpc)
TR_URL="http://localhost:9091/transmission/rpc"

# Wheres your transmission-remote binary?
CLIPATH="/usr/bin/transmission-remote"

# Remove o torrent que finalizou
${CLIPATH} "${TR_URL}" --torrent "${TR_TORRENT_ID}" --remove

exit 0
