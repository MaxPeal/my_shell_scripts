#!/bin/bash

for i in *; do
	echo -n "  Executando: video2avi.sh \"${i}\" ${1} ... "
	video2avi.sh "${i}" "${1}" > "${i}.video2avi.log" 2>&1
	echo "OK"
done
