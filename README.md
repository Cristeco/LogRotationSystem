# Intervalos para la Ejecución de los Scripts en Crontab

Coloca los siguientes intervalos en el archivo crontab con el comando:

crontab -e

## Configuración de Crontab

### Ejecutar `archivarLogs.sh` diariamente a las 23:29

29 23 * * * /home/cristian-terceros/Documentos/LogRotationSystem/archivarLogs.sh

### Ejecutar `rotarLogs.sh` cada 30 días a las 23:59

59 23 */30 * * /home/cristian-terceros/Documentos/LogRotationSystem/rotarLogs.sh

