#!/bin/bash
#Script de Demonstagem do HD Externo após Backup do fileserver da Bonilha
#Author : Lucas Azevedo
#Date : 31/07/2018

#Variáveis
HD=/dev/sdb1
DATA=$(date +%d/%m/%Y)
DATE=$(date +%d_%m_%Y)
LOG=/var/log/backup/fileserver_hd.txt

#Iniciando LOG
echo "--------------------------------------------------------------" >> $LOG
echo "Data = $DATA" >> $LOG
echo " Desmontagem do HD Realizada " >> $LOG
echo "--------------------------------------------------------------" >> $LOG
#Desmontagem do HD EXTERNO

/bin/umount $HD
