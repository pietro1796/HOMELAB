#!/bin/bash

### CONFIG
DB_CONTAINER="guac-mysql"
DB_NAME="guacamole_db"
DB_USER="root"
DB_PASS="guac_root_pass"

BACKUP_DIR="/home/guacamole/backups"
RETENTION_DAYS=14

DATE=$(date +"%Y-%m-%d_%H-%M")
FILE="$BACKUP_DIR/guac_db_$DATE.sql"
ARCHIVE="$FILE.gz"

echo "=== Guacamole DB Backup $(date) ==="

# Crea cartella se non esiste
mkdir -p $BACKUP_DIR

echo "-> Eseguo dump database..."
docker exec $DB_CONTAINER mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $FILE

if [ $? -ne 0 ]; then
  echo "❌ Errore durante mysqldump"
  exit 1
fi

echo "-> Comprimo backup..."
gzip $FILE

echo "-> Rimuovo backup più vecchi di $RETENTION_DAYS giorni..."
find $BACKUP_DIR -name "guac_db_*.sql.gz" -mtime +$RETENTION_DAYS -delete

echo "✅ Backup completato: $ARCHIVE"
