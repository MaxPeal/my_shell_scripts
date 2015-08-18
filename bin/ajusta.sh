#!/bin/bash

let t2=`echo "$2 " | wc -m`-1
let tm=$3-2*$t2
r="/^$2 .*/p"

cp $1 $1.bak

IFS=$'\n'
for s in `sed $1 -n -e "$r"`
do

    sa=`echo $s | awk -F "$2 " '{print $2}'`
    let tsa=`echo "$sa" | wc -m`-1

    if ((tsa>=tm))
    then
    	continue
    fi

    troca="$2 "
    let td=tm-tsa
    let m=td%2

    for ((c=1; c<=(td-m)/2; c++))
    do
    	troca="$troca "
    done

    troca="${troca}$sa "

    for ((c=1; c<=(td+m)/2; c++))
    do
    	troca="$troca "
    done

    troca="${troca}`inverte.sh $2`"
    troca=`pstr.sh $troca`
    s=`pstr.sh $s`
    sed -i $1 -e "s/${s}/${troca}/g"

done
IFS=$'\n\t '

less $1
echo -e "\tBACKUP:   \"$1.bak\""
echo -e "\tMODIFIED: \"$1\""

