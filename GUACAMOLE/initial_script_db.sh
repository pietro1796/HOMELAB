#!/bin/bash

echo "=== Guacamole DB Initialization ==="

GUAC_CONTAINER="guacamole"
DB_CONTAINER="guac-mysql"
SQL_FILE="/home/guacamole/initdb.sql"

echo "-> Genero schema database da container guacamole..."
docker exec -i $GUAC_CONTAINER /opt/guacamole/bin/initdb.sh --mysql > $SQL_FILE

if [ $? -ne 0 ]; then
  echo "❌ Errore generazione initdb.sql"
  exit 1
fi

echo "-> Importo schema nel database guacamole_db..."
cat $SQL_FILE | docker exec -i $DB_CONTAINER mysql -u root -pguac_root_pass guacamole_db

if [ $? -ne 0 ]; then
  echo "❌ Errore import database"
  exit 1
fi

echo "✅ Database Guacamole inizializzato correttamente!"
