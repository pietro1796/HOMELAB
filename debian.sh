# Aggiornare server
apt update & apt upgrade -y
# Installare pacchetti base
apt install sudo wget curl net-tools unzip -y
# Settare TimeZone corretto      
timedatectl set-timezone Europe/Rome
