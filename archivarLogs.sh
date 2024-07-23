#!/bin/bash
LIST_FILES=(
        #"/home/erick/Escritorio/Modulo diplomado/clase 22-07-2024/logs/Apache_2k.log"
	"/home/cristian-terceros/Documentos/logs/Apache_2k.log"
)

#ARCHIVE_DIR="/home/erick/Escritorio/Modulo diplomado/clase 22-07-2024/LogsFile"
ARCHIVE_DIR="/home/cristian-terceros/Documentos/LogsFile"
mkdir -p "$ARCHIVE_DIR"

DATE=$(date +"%Y%m%d%H%M%S")
YEAR=$(date +"%Y")
MONTH=$(date +"%m")

for FILE in "${LIST_FILES[@]}"; do
        FILE_NAME=$(basename "$FILE" .log)

        mkdir -p "$ARCHIVE_DIR/$FILE_NAME"
        mkdir -p "$ARCHIVE_DIR/$FILE_NAME/$YEAR"
        mkdir -p "$ARCHIVE_DIR/$FILE_NAME/$YEAR/$MONTH"

        NEW_FILE="$ARCHIVE_DIR/$FILE_NAME/$YEAR/$MONTH/${FILE_NAME}_logs_$DATE.tar.gz"
        echo $NEW_FILE
        tar -czf "$NEW_FILE" -C "$(dirname "$FILE")" "$(basename "$FILE")"
done
