# Intervalos para la Ejecución de los Scripts en Crontab

Coloca los siguientes intervalos en el archivo crontab con el comando:

crontab -e

## Configuración de Crontab

### Ejecutar `archivarLogs.sh` diariamente a las 23:59 hrs

59 23 * * * /home/cristian-terceros/Documentos/LogRotationSystem/archivarLogs.sh

### Ejecutar `rotarLogs.sh` el primer dia de cada mes a las 00:00 hrs

0 0 1 * * /home/cristian-terceros/Documentos/LogRotationSystem/rotarLogs.sh

