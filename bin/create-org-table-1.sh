#!/bin/bash
cp tabela_resultado_preliminar_provas_objetiva_e_teorico-pratica.org tmp.bak
rm -f tabela_resultado_preliminar_provas_objetiva_e_teorico-pratica.org
IFS=$'\n'
let l=1
for i in `cut -d '|' -f 3 tmp.bak`; do
	echo -n `sed "$l p" -n tmp.bak` >> tabela_resultado_preliminar_provas_objetiva_e_teorico-pratica.org
	echo -n ' ' >> tabela_resultado_preliminar_provas_objetiva_e_teorico-pratica.org
	echo -n `grep $i tabela_resultado_oficial_prova_objetiva.org | cut -d '|' -f 5 | sed s/[[:blank:]]*$// | sed s/^[[:blank:]]*//` >> tabela_resultado_preliminar_provas_objetiva_e_teorico-pratica.org
	echo ' |' >> tabela_resultado_preliminar_provas_objetiva_e_teorico-pratica.org
	let l++
done
rm -f tmp.bak
