#!/bin/bash
#Script de Backup Full para HD Externo dos Dados do FIleserver da Imobiliária Silvio Pereira
#Author: Lucas Azevedo
#Date: 28/03/2019

###ESTRUTURA DE BACKUP

#Variaveis
DATA=$(date +%d/%m/%Y)
DATE=$(date +%d_%m_%Y)
HORA=$(date +%H:%M)
LOG=/var/log/bkp_full.txt
LOG_HD=/var/log/bkp_hd_mgmt.txt
ORIGEM=/fileserver
DESTINO="/mnt/hd/bkp_fileserver/$DATE"

#Iniciando LOG BKP
echo "--------------------------------------------------------------" >> $LOG
echo "Data = $DATA" >>$LOG
echo "Inicio do BKP = $HORA Hr" >> $LOG

#Iniciando LOG Gerenciamento do HD Externo
echo "--------------------------------------------------------------" >> $LOG_HD
echo "Data = $DATA" >> $LOG_HD
echo " Montagem do HD Realizada " >> $LOG_HD
#echo "--------------------------------------------------------------" >> $LOG

#Montagem do HD Externo

/sbin/mount.ntfs /dev/sdb1 /mnt/hd/

#Criação da Pasta para Backup

/bin/mkdir /mnt/hd/bkp_fileserver/$DATE/

#Copiando a pasta Fileserver
/bin/cp -Rf $ORIGEM $DESTINO

#Continuando LOG
echo "Dados copiados de $ORIGEM com sucesso para $DESTINO " >>$LOG

#Resultado do Backup
echo "Diff das pastas de Origem e Destino" >> $LOG
/usr/bin/diff $ORIGEM $DESTINO >> $LOG

#Desmontando HD Externo
/bin/umount /mnt/hd

#Finalizando Log de Gerenciamento do HD
echo "--------------------------------------------------------------" >> $LOG_HD
echo "Data = $DATA" >> $LOG_HD
echo " Desmontagem do HD Realizada " >> $LOG
echo "--------------------------------------------------------------" >> $LOG_HD

#Finalizando Log de BKP
echo "Fim do BKP = $HORA Hr" >> $LOG
echo "--------------------------------------------------------------" >> $LOG

### FIM DA ESTRUTURA DE BACKUP

###ESTRUTURA DE REPETICAO

#Variaveis
CONT=`/bin/ls -l /mnt/hd/bkp_fileserver/ | /usr/bin/wc | /usr/bin/awk 'END{print $1}'`
OLDBKP=`/bin/ls -l /mnt/hd/bkp_fileserver/ | /usr/bin/cut -d ' '  -f 9 | /bin/grep -n 2 | /usr/bin/cut -d : -f 2 | /usr/bin/head -n 1`

if [ $CONT -le "14" ]
  then
    echo " " >> /dev/null
  else
    /bin/rm -Rf $OLDBKP
fi

###FIM DA ESTRUTURA DE REPETICAO
