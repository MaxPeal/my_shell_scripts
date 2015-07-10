#!/bin/bash
save_pwd=`pwd`
for i in `find .`
do
	if [ -d "$i" ]
	then
		cd "$i"
		autoconf 2>/dev/null
		cd "$save_pwd"
	fi
done
