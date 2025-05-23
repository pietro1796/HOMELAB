# Aggiornare server
apt update & apt upgrade -y
echo "Finiti Aggiornamenti"
# Installare pacchetti base
apt install sudo wget curl net-tools unzip -y
echo "Installati pacchetti"
# Settare TimeZone corretto      
timedatectl set-timezone Europe/Rome
echo "Settato TimeZone"
# Set Swappiness
echo "vm.swappiness = 10" >> /etc/sysctl.conf
echo "Settata Swappiness"
