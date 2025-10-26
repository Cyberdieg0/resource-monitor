#!/bin/bash

LOGFILE="/var/log/security/system_resource_report.log"

mkdir -p /var/log/security #directorio de logs

echo "==============================" >> $LOGFILE
echo "REPORTE DE RECURSOS - $(date "+%Y-%m-%d %H:%M:%S")" >> $LOGFILE
echo "==============================" >> $LOGFILE

echo -e "\n--- 1. uso de ram ---" >> $LOGFILE #analisi de picos de memoria
free -h | grep -E 'Mem|Swap' >> $LOGFILE

echo -e "\n--- 2. uso de disco en directorios clave ---" >> $LOGFILE 
df -h --output=source,size,used,pcent,target | grep -E '^/dev/|^Filesystem|/tmp|/var|/home' >> $LOGFILE

echo -e "\n--- 3. 5 procesos por cpu ---" >> $LOGFILE
ps aux --sort=-%cpu | head -n 6 | awk "{print \$1, \$2, \$3, \$4, \$11}" >> $LOGFILE

echo -e "\n--- 4. 5 procesos por memoria ---" >> $LOGFILE
ps aux --sort=-%mem | head -n 6 | awk "{print \$1, \$2, \$3, \$4, \$11}" >> $LOGFILE

echo "-----------------------------" >> $LOGFILE
echo "Bloque de reporte finalizado." >> $LOGFILE
