#!/bin/bash
#Script de Montagem para backup do Fileserver em HD Externo dos Dados de Rede da Bonilha e contagem de backups realizados
#Author: Lucas Azevedo
#Date: 16/05/2018

#Variáveis
DATA=$(date +%d/%m/%Y)
DATE=$(date +%d_%m_%Y)
LOG=/var/log/backup/fileserver_hd.txt

#Iniciando LOG
echo "--------------------------------------------------------------" >> $LOG
echo "Data = $DATA" >> $LOG
echo " Montagem do HD Realizada " >> $LOG
echo "--------------------------------------------------------------" >> $LOG

#MONTAGEM DO HD EXTERNO

/sbin/mount.ntfs /dev/sdb1 /mnt/hd/

#FIM DA MONTAGEM DO HD EXTERNO

#CRIAÇÃO DA PASTA PARA BACKUP

/bin/mkdir /mnt/hd/fileserver/$DATE/

#FIM DA CRIAÇÃO DA PASTA PARA BACKUP

###ESTRUTURA DE REPETICAO

#Variaveis de uso na Repetição
CONT=`/bin/ls -l /mnt/hd/fileserver/ | /usr/bin/wc | /usr/bin/awk 'END{print $1}'`
OLDBKP=`/bin/ls -l /mnt/hd/fileserver | /usr/bin/cut -d ' '  -f 9 | /bin/grep -n 2 | /usr/bin/cut -d : -f 2 | /usr/bin/head -n 1`

if [ $CONT -le "6" ]
  then
    echo " " >> /dev/null
  else
    /bin/rm -Rf $OLDBKP
fi

###FIM DA ESTRUTURA DE REPETICAO
