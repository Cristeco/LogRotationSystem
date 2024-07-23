#!/bin/bash
#ubicacion del archivo en la maquina virtual
#ARCHIVE_DIR="/home/erick/Escritorio/Modulo diplomado/clase 22-07-2024/LogsFile"
ARCHIVE_DIR="/home/cristian-terceros/Documentos/LogsFile"
#usuario de la maquina fisica, ip y ubicacion carpeta
REMOTE_USER="HP"
#REMOTE_HOST="192.168..."
REMOTE_HOST="192.168.0.1"
#REMOTE_DIR="C:\Users\HP\Desktop\Pasatiempos"
REMOTE_DIR="D:\Carrera\Diplomado\Taller"

scp -r "$ARCHIVE_DIR" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
echo "Rotación de logs completada y transferidos a $REMOTE_HOST:$REMOTE_DIR"
