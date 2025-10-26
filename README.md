RESOURCE MONITOR

Script basico en Bash orientado en blue team para automatizar la vigilancia de recursos en sistemas Linux. Su objetivo principal es detectar procesos anómalos que puedan indicar amenazas
Establece una línea base del comportamiento normal de tu cpu, memoria y disco. Si un proceso desconocido satura el sistema, lo detectara en el log.
Hecho con comandos estandar de linux ps, df, free, awk para garantizar buena compatibilidad y consumo minimo de recursos

1. sudo mkdir -p /var/log/security
2. chmod +x resource_monitor.sh
3. sudo ./resource_monitor.sh
4. automatizar con cron:
   sudo crontab -e
5. al final del archivo colocar:
   */15 * * * * /home/(tu_usuario)/resourcemonitor/resource_monitor.sh
6. sudo tail /var/log/security/system_resource_report.log

Mostrara ultimo reporte con cron cada 15 mins ya que el script funcionara solo
