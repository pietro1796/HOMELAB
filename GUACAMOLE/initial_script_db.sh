#!/bin/bash

echo "=== Guacamole DB Initialization ==="

# Nomi container (come nello stack)
GUAC_CONTAINER="guacamole"
DB_CONTAINER="guac-mysql"

# Percorso file SQL sull'host
SQL_FILE="/home/guacamole/initdb.sql"

echo "-> Genero schema database da container guacamole..."
docker exec -i $GUAC_CONTAINER /opt/guacamole/bin/initdb.sh --mysql > $SQL_FILE

if [ $? -ne 0 ]; then
  echo "❌ Errore generazione initdb.sql"
  exit 1
fi

echo "-> Copio schema nel container MySQL..."
docker cp $SQL_FILE $DB_CONTAINER:/initdb.sql

echo "-> Importo schema nel database guacamole_db..."
docker exec -i $DB_CONTAINER mysql -u root -pguac_root_pass guacamole_db < /initdb.sql

if [ $? -ne 0 ]; then
  echo
