#!/bin/bash
#Script de Backup Full para HD Externo dos Dados de Rede da Bonilha
#Author: Lucas Azevedo
#Date: 16/05/2018

###ESTRUTURA DE BACKUP

#Variaveis
DATA=$(date +%d/%m/%Y)
DATE=$(date +%d_%m_%Y)
HORA=$(date +%H:%M)
LOG=/var/log/backup/bkp_full.txt
ORIGEM=/home/fileserver/dados
DESTINO=vmg-ad-rep-02:/mnt/hd/fileserver/$DATE/

#Iniciando LOG
echo "--------------------------------------------------------------" >> $LOG
echo "Data = $DATA" >>$LOG
echo "Inicio do BKP = $HORA Hr" >> $LOG

#Copiando a pasta Dados
/usr/bin/scp -r $ORIGEM root@vmg-ad-rep-02:/mnt/hd/fileserver/$DATE/

#Continuando LOG
echo "Dados copiados de $ORIGEM com sucesso para $DESTINO " >>$LOG

#Montando Compartilhamento NFS para execução do diff
/bin/mount vmg-ad-rep-02:/mnt/hd/fileserver /mnt/bkp

#Resultado do Backup
echo "Diff das pastas de Origem e Destino" >> $LOG
/usr/bin/diff $ORIGEM /mnt/bkp/$DATE/dados >> $LOG

#Demonstando Compartilhamento NFS
/bin/umount /mnt/bkp

#Finalizando Log
echo "Fim do BKP = $HORA Hr" >> $LOG
echo "--------------------------------------------------------------" >> $LOG

### FIM DA ESTRUTURA DE BACKUP
