#!/bin/bash
nome="$1"
shift 1
for i in "$@"
do
	sufixo="$(echo "$i" | awk -F "$nome" '{printf "%s", $2}')"
	if [ -z "$sufixo" -o -n "$(echo "$sufixo" | grep '-')" ]
	then
		continue
	fi
	prefixo="$(echo "$i" | awk -F "$nome" '{printf "%s", $1}')"
	mv "$i" "${prefixo}${nome}-${sufixo}"
done
