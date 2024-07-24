#!/bin/bash
#ubicacion del archivo en la maquina virtual
#ARCHIVE_DIR="/home/erick/Escritorio/Modulo diplomado/clase 22-07-2024/LogsFile"
ARCHIVE_DIR="/home/cristian-terceros/Documentos/dailyLogs"
#usuario de la maquina fisica, ip y ubicacion carpeta
#REMOTE_USER="HP"
REMOTE_USER="cristian-terceros"
#REMOTE_HOST="192.168..."
REMOTE_HOST="192.168.0.21"
#REMOTE_DIR="C:\Users\HP\Desktop\Pasatiempos"
REMOTE_DIR="/home/cristian-terceros/Documentos/Taller/LogsFile"

# Verificar si se pasan parámetros para el mes y el año
if [ $# -eq 2 ];
then
	MONTH=$1
	YEAR=$2
else
	YEAR=$(date +"%Y")
	MONTH=$(date +"%m")
fi
# Obtener la lista de directorios en ARCHIVE_DIR
LIST_DIRS=($(ls -d $ARCHIVE_DIR/*))

for DIR in "${LIST_DIRS[@]}"; 
do
       	if [ -d "$DIR" ];
	then
		DIR_NAME=$(basename "$DIR")
		# Crear la estructura de directorios en la máquina remota
		ssh "$REMOTE_USER@$REMOTE_HOST" "mkdir -p $REMOTE_DIR/$DIR_NAME/$YEAR/$MONTH"
		# Copiar los archivos al destino remoto
		scp -r "$DIR"/* "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/$DIR_NAME/$YEAR/$MONTH"
		echo "Archivos de $DIR transferidos a $REMOTE_HOST:$REMOTE_DIR/$DIR_NAME/$YEAR/$MONTH"
	fi
done
#scp -r "$ARCHIVE_DIR" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"

rm -rf $ARCHIVE_DIR/*
echo "Contenido de $ARCHIVE_DIR eliminado después de la transferencia."

echo "Rotación de logs completada y transferidos a $REMOTE_HOST:$REMOTE_DIR"


