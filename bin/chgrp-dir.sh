#!/bin/bash
if [ -d "${1}" ]
then
	if [ "`/home/joaomanoel/bin/grouper-dir.sh \"${1}\"`" == "${2}" ]
	then
		echo -n "  Exec: sudo chgrp ${3} \"${1}\" ... "
		sudo chgrp ${3} "${1}"
		echo "OK"
	fi
fi 
