#!/bin/bash

for i in `cat $1`
do
	echo $i | awk -F '.tazpkg' '{print $1}'
done

exit 0
