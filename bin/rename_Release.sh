#!/bin/bash

for i in `find . -name "Release.txt"`; do
	mv ${i} "`dirname ${i}`/`basename ${i} .txt`"
done


