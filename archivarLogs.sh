#!/bin/bash
LIST_FILES=(
        #"/home/erick/Escritorio/Modulo diplomado/clase 22-07-2024/logs/Apache_2k.log"
	$(ls /home/cristian-terceros/Documentos/logs/*.log)
)

#ARCHIVE_DIR="/home/erick/Escritorio/Modulo diplomado/clase 22-07-2024/LogsFile"
ARCHIVE_DIR="/home/cristian-terceros/Documentos/dailyLogs"
mkdir -p "$ARCHIVE_DIR"

if [ $# -eq 3 ];
then
	DAY=$1
	MONTH=$2
	YEAR=$3
	DATE="$YEAR$MONTH$DAY$(date +%H%M%S)"
else
	DATE=$(date +"%Y%m%d%H%M%S")
	YEAR=$(date +"%Y")
	MONTH=$(date +"%m")
fi

for FILE in "${LIST_FILES[@]}"; do
        FILE_NAME=$(basename "$FILE" .log)

        mkdir -p "$ARCHIVE_DIR/$FILE_NAME"
#        mkdir -p "$ARCHIVE_DIR/$FILE_NAME/$YEAR"
#        mkdir -p "$ARCHIVE_DIR/$FILE_NAME/$YEAR/$MONTH"

#        NEW_FILE="$ARCHIVE_DIR/$FILE_NAME/$YEAR/$MONTH/${FILE_NAME}_logs_$DATE.tar.gz"
	NEW_FILE="$ARCHIVE_DIR/$FILE_NAME/${FILE_NAME}_logs_$DATE.tar.gz"
        echo $NEW_FILE
        tar -czf "$NEW_FILE" -C "$(dirname "$FILE")" "$(basename "$FILE")"
done
