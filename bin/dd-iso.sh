#!/bin/bash
let sk=0
let co=2048
for ((i=0;i<11;i++)); do
  echo -n -e "\n\tPROCESSANDO: \"$1.$i\" ... "
  dd if=$1 of=$1.$i bs=1048576 skip=$sk count=$co > /dev/null 2>&1
  echo "OK"
  let sk=$sk+$co
done
echo ""

