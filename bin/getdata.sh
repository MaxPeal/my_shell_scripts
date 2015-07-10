#!/bin/bash
cd ~/Share_VBox/gerenciamento_de_redes/exercicio.05
if [ ! -f "./count.txt" ]
then
	count=0
else
	count=`cat ./count.txt`
	let count=${count}+10
fi
echo ${count} > ./count.txt
echo ${count} `snmpget -v 1 -c jm7_ro 192.168.0.101 .1.3.6.1.2.1.2.2.1.10.3 | cut -d ' ' -f 4` >> ./ifinoct.log
echo ${count} `snmpget -v 1 -c jm7_ro 192.168.0.101 .1.3.6.1.2.1.2.2.1.16.3 | cut -d ' ' -f 4` >> ./ifoutoct.log
echo `snmpwalk -v 1 -c jm7_ro 192.168.0.101 .1.3.6.1.2.1.6.13.1.3 | cut -d ' ' -f 1 | cut -d '.' -f 11-20` >> ./tcpact.log.${count}
