#apt update -y > /dev/null && apt install curl -y && bash -c "$(curl -fsSL https://raw.githubusercontent.com/pietro1796/HOMELAB/refs/heads/main/debian.sh)"
# Aggiornare server
apt update -y > /dev/null && apt upgrade -y > /dev/null
echo "Finiti Aggiornamenti"
# Installare pacchetti base
apt install sudo wget curl net-tools vainfo unzip -y
echo "Installati pacchetti"
# Settare TimeZone corretto      
timedatectl set-timezone Europe/Rome
echo "Settato TimeZone"
# Set Swappiness
echo "vm.swappiness = 10" >> /etc/sysctl.d/swappiness.conf
echo "Settata Swappiness"
#Set SHH Login
sed -i 's/^#\?PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
systemctl restart ssh
echo "SSH Abilitato"
