#!/bin/bash
#Script de Backup Full para HD Externo dos Dados de Rede da Bonilha
#Author: Lucas Azevedo
#Date: 16/05/2018

###ESTRUTURA DE BACKUP

#Variaveis
DATA=$(date +%d/%m/%Y)
DATE=$(date +%d_%m_%Y)
HORA=$(date +%H:%M)
LOG=/var/log/bkp_full.txt
ORIGEM=/home/fileserver/dados
DESTINO=/mnt/bkp

#Iniciando LOG
echo "--------------------------------------------------------------" >> $LOG
echo "Data = $DATA" >>$LOG
echo "Inicio do BKP = $HORA Hr" >> $LOG

#Montando HD Externo
#/bin/mount -t ntfs /dev/  $DESTINO

#Copiando a pasta Dados
/bin/cp -Rf $ORIGEM /mnt/bkp/fileserver/$DATE/

#Continuando LOG
echo "Dados copiados de $ORIGEM com sucesso para $DESTINO " >>$LOG

#Resultado do Backup
echo "Diff das pastas de Origem e Destino" >> $LOG
/usr/bin/diff $ORIGEM /mnt/bkp/fileserver/$DATE/dados >> $LOG

#Desmontando HD Externo
#/bin/umount $DESTINO

echo "Fim do BKP = $HORA Hr" >> $LOG
echo "--------------------------------------------------------------" >> $LOG

### FIM DA ESTRUTURA DE BACKUP

###ESTRUTURA DE REPETICAO

#Variaveis
CONT=`/bin/ls -l /mnt/bkp/fileserver/ | /usr/bin/wc | /usr/bin/awk 'END{print $1}'`
OLDBKP=`/bin/ls -l /mnt/bkp/fileserver | /usr/bin/cut -d ' '  -f 9 | /bin/grep -n 2 | /usr/bin/cut -d : -f 2 | /usr/bin/head -n 1`

if [ $CONT -le "7" ]
  then
    echo " " >> /dev/null
  else
    /bin/rm -Rf $OLDBKP
fi

###FIM DA ESTRUTURA DE REPETICAO
