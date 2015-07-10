#!/bin/bash

#IFS=`printf ' \t\n'`
IFS=$' '$'\t'$'\n'
lp="   "
#let c=0

for i in `cat $1`; do
#    if ((c<4)); then
#        lp="${lp} ${i}"
#        let c++
#    else
         lp="${lp} ${i} \\ \n   "
#        let c=0
#    fi
done

fn="/tmp/packages.list.`date +"%d%m%Y%H%M%S"`"

echo -e "${lp}" > ${fn}

sed -i -e 's/[[:blank:]]*$//' ${fn}

sort -u ${fn}

rm -f ${fn}
