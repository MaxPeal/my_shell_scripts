#!/bin/bash
rm -f tabela_resultado_oficial_prova_objetiva.org
for ((a=1; a<=71; a++)); do
	for ((b=1; b<=4; b++)); do
		echo -n '| ' >> tabela_resultado_oficial_prova_objetiva.org
		echo -n `sed "$a p" -n tabela_resultado_oficial_prova_objetiva.org.$b` >> tabela_resultado_oficial_prova_objetiva.org
		echo -n ' ' >> tabela_resultado_oficial_prova_objetiva.org
	done
	echo '|' >> tabela_resultado_oficial_prova_objetiva.org
done
