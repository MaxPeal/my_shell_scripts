#!/bin/bash
for i in `tar tf "${1}"`
do
	echo -n "  EXECUTANDO: sudo chown root.root \"/${i}\" ... "
	sudo chown root.root "/${i}"
	echo "OK"
done
