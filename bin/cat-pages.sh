#!/bin/bash

arquivo_txt="${1}.txt"
[ -f "$arquivo_txt" ] && rm -f "$arquivo_txt"
touch $arquivo_txt

IFS=$'\n'
for (( i=1; i<=${2}; i++)); do
    [ -f "${1}-page${i}.txt" ] && cat "${1}-page${i}.txt" >> $arquivo_txt
done

exit 0
