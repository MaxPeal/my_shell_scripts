#!/bin/bash

help_exit () {
	echo "Usage: `basename $0` name1 name2"
	echo "Replace name1 with name2 in all name-files, in all directories from current directory"
	exit -1
}

check_args () {
	if [ -n "$3" ]; then
		help_exit
	fi
	if [ -z "$1" -o -z "$2" ]; then
		help_exit
	fi
	if [ "$1" == "$2" ]; then
		help_exit
	fi
}

move () {
	if [ "`echo -n $3 | grep $1`" ]; then
		pA="`echo -n $3 | awk -F $1 '{ print $1 }'`"
		pB="`echo -n $3 | awk -F $1 '{ print $2 }'`"
		new="${pA}${2}${pB}"
		echo    "move $3 \\"
		echo -n "  to $new ... "
		mv -f $3 $new
		echo OK
	fi
}

check_args $@

list=`find .`

for i in $list; do
	move $1 $2 $i
done


