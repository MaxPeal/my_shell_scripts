#!/bin/sh

# ############## Secretaria Municipal de Saude - Central de Informatica ######################
#
# Script de Instalação da imagem linux generica
#
# versao 3.0
#########################################################################################

# A imagem é gerada estando na raiz do sistema e digitando o comando:
# find . -mount | cpio -o >/caminho/imagem.cpio
# mas para funcionar perfeitamente, o sistema não é utilizado no momento que esta sendo gerado,
# portanto, o boot é feito por uma distro live.



zeraParticoes () {
fdisk $1 >/dev/null 2>&1 <<EOF
o
w
p
EOF

}

ativaPrimeiraParticao () {
fdisk $1 >/dev/null 2>&1 <<EOF
a
1
w	
EOF
}

criaSwap () {
fdisk $1 >/dev/null 2>&1 <<EOF
n
p
3


t
3
82
w
EOF

}

#sintaxe: numero size dispositivo

criaParticao () {
vsize=$2
cont=$1	
if [ "$?" != "0" ]; then exit; fi 

fdisk $3 >/dev/null 2>&1 <<EOF
n
p
${cont}

+${vsize}
w
EOF

}

getSizePrimeiroDisk () {
	DSIZE=$(fdisk -l | grep "Disk /dev/" | cut -f 3 -d " " | awk -F "." {'print $1'})
	DSIZE=$(echo $DSIZE | awk {'print $1'})
	
}
	
getDisco () {
	DISCO=$(fdisk -l | grep "Disk /dev" | cut -f 2 -d " " | awk -F "." {'print $1'} | cut -f 1 -d ":")
	DISCO=$(echo $DISCO | cut -f 1 -d " ")
}
	
getPendrive () {
	PENDRIVE=$(findfs LABEL=LAB)
}

ConfiguraBoot () {
	if [ "$DISCO" = "/dev/sda" ]; then
		mv /mnt/target/boot/grub/grub.cfg.sda /mnt/target/boot/grub/grub.cfg
	else
		mv /mnt/target/boot/grub/grub.cfg.hda /mnt/target/boot/grub/grub.cfg
	fi

}

#msbox mesagem
msgbox () {

	dialog --backtitle "Secretaria Muncipal de Saude - Central de Informatica" --title "Instalacao de imagem linux" --msgbox "$1" 0 0

}

decisao () {
	dialog --stdout --backtitle "Secretaria Municipal de Saude - Central de informatica" --yesno "$1"  10 50
	return $?
}

#seErroSai inteiro mesagem
seErroSai () {
	if [ $1 != 0 ]; then
		msgbox "$2"
		desmontarUnidades
		exit
	fi
}
	
montarUnidade () {
	mkdir /mnt/target
	mkdir /mnt/pendrive
	mkdir /mnt/home
	umount /mnt/target
	umount /mnt/pendrive
	umount /mnt/home
	mount "$DISCO"1 /mnt/target
	mount "$DISCO"2 /mnt/home
	mount "$PENDRIVE" /mnt/pendrive
	clear 
}
	
desmontarUnidades () {
	umount /mnt/target
	umount /mnt/pendrive
	umount /mnt/home
	rmdir /mnt/target
	rmdir /mnt/pendrive
	rmdir /mnt/home
	clear
}

#backup de configurações e dados do usuario

VerificarDisco () {
	getDisco
	getPendrive
	if [ "$DISCO" = "" ]; then seErroSai 1 "Nenhuma unidade de disco encontrada"; fi
	getPendrive
	if [ "$PENDRIVE" = "" ]; then seErroSai 1 "Pendrive não localizada. Verifique se o nome da pendrive esta setada para LAB."; fi
	getSizePrimeiroDisk
	
	if [ $PENDRIVE = $DISCO ]; then seErroSai 1 "Nenhuma unidade de disco encontrada"; fi
	
	if [ $DSIZE -lt "10" ]; then seErroSai 1 "O sistema nao pode ser instalado em um hd menor que 10GB"; fi	

}

backup () {
	montarUnidade
	
	VERSION=$(cat /mnt/target/usr/share/version)
	if [ "$VERSION" = "Linux G010-gnulinux 2.6.32-5-686 #1 SMP Sun May 6 04:01:19 UTC 2012 i686 GNU/Linux" ]; then
	if [ -d "/mnt/target/etc" ];  then
		tar -cf /mnt/pendrive/backp-config.tar /mnt/target/etc/hostname /mnt/target/etc/hosts /mnt/target/etc/resolv.conf /mnt/target/etc/ocsinventory/ocsinventory-agent.cfg
			if [ $? != 0 ]; then 
				msgbox "Nao foi possivel salvar as configuracoes";
			else 
				msgbox "Arquivos de configuracao salvos!!!"
			fi
	else 
		msgbox "Arquivos nao encontrados"
	fi
	
	if [ -d "/mnt/home/saude" ];  then
	
		tar -cf /mnt/pendrive/backp-home.tar /mnt/home/saude
		if [ $? != 0 ]; then
			msgbox "Nao foi possivel salvar dados do usuario";
		else
			msgbox "Dados da particao home foram salvos";
		fi
	else 
		msgbox "Pasta do usuario nao encontrada"
	fi
	else
	    msgbox "Versão incorreta do S.O.";
	fi
	
	desmontarUnidades
}

particionarHd () {
	desmontarUnidades
	#calcula tamanho das partiçoes: 80% raiz 20% home
	SIZERAIZ=$(echo $DSIZE | awk '{print $1/100*80'})
	SIZEHOME=$(echo $DSIZE | awk '{print $1/100*20'})
	
	zeraParticoes $DISCO
	criaParticao 1 "$SIZERAIZ"G $DISCO
	ativaPrimeiraParticao $DISCO
	criaSwap $DISCO
	sleep 5
	swapoff -a
	sleep 5
	hdparm -z $DISCO
	sleep 5
	clear
	echo "Formatando particao RAIZ"
	mkfs.ext3 "$DISCO"1 -L raiz
	if [ $? != 0 ]; then
		msgbox "Erro ao Formatar Particao raiz. Reinicie o computador e tente novamente"
		exit
	fi
	clear
		
}
	
copiaArquivosSistema () {
	montarUnidade
	ROOTFS=$(find /mnt/pendrive -iname "backup.cpio")

	if [ -f "$ROOTFS" ]; then
		cd /mnt/target
		clear
		echo "Descompactando arquivos do sistema na particao raiz... Este processo pode levar de 2 a 4 minutos dependendo da velocidade do computador"
		cpio -idF "$ROOTFS"
		if [ $? != 0 ]; then
			msgbox "Erro ao descompactar aquivos da imagem da particao raiz!!!!";
			exit
		fi
	else
		msgbox  "Arquivos \"backup.cpio\" nao encontrado na pendrive"
		exit
	fi
	
#	HOMEFS=$(find /mnt/pendrive -iname home.gz)
#	if [ -f "$HOMEFS" ]; then
#		cd /mnt/home
#		clear
#		echo "Descompactando arquivos do sistema na particao do usuario...."
#		gzip -d < "$HOMEFS" | cpio -idv
#		if [ $? != 0 ]; then
#			msgbox "Erro ao descompactar aquivos da imagem da particao do usuario!!!!\n Alguns computadores precisao ser reiniciador para ativar as partições..."; 
#			exit
#		fi
#		desmontarUnidades
#	else
#		msgbox "Arquivo de Imagem do usuario nao encontrado.\n Adicione o arquivo\"home.gz\" na pendrive";
#		exit
#	fi

}

voltaBackup () {
	cd /
	montarUnidade

	if [ -f /mnt/pendrive/backp-home.tar ]; then
		tar -xvf /mnt/pendrive/backp-home.tar;
		
		if [ $? != 0 ]; then
			msbox "Erro ao restaurar backup das configuracoes"
		fi
		rm /mnt/pendrive/backp-home.tar
	fi

	if [ -f /mnt/pendrive/backp-config.tar ]; then
		tar -xvf /mnt/pendrive/backp-config.tar
		

		if [ $? != 0 ]; then
			msbox "Erro ao restaurar backup do usuario"
		fi
		rm /mnt/target/etc/rede.tmp
		rm /mnt/pendrive/backp-config.tar
	fi
	
	desmontarUnidades

}

instalarGrub(){
	montarUnidade

	TEMP=$(echo "$DISCO"1 | cut -f 3 -d /);

	#instala grub na mbr
	rm /mnt/target/boot/grub/device.map
	rm -f /mnt/target/etc/udev/rules.d/70-persistent-net.rules
	grub-install --no-floppy --root-directory=/mnt/target $DISCO
	
	if [ $? != 0 ]; then
		msbox "Erro ao instalar gerenciador de boot"
		desmontarUnidades
		exit
	fi

}

main () {
	VerificarDisco
	decisao "Unidade de disco encontrada:$DISCO $DSIZE GB\n\n O processo seguinte pode resultar em perda de dados.\n\n Deseja continuar?"
	if [ "$?" != "0" ]; then exit; fi ;
	decisao "Deseja Salvar dados de configuracao e arquivos do usuario. Nao funciona para imagem linux antiga ou Windows"
	if [ "$?" = "0" ]; then  backup ; fi 
	decisao "O proximo passo ira particionar e formatar o disco. Deseja Continuar?"
	if [ "$?" != "0" ]; then  exit ; fi 
	particionarHd
	copiaArquivosSistema
	voltaBackup
	instalarGrub
	ConfiguraBoot
	msgbox "Instalacao concluida com sucesso!!!" $DISCO
}

main
