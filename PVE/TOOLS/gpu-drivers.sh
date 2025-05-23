echo "deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware
deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware" > /etc/apt/sources.list.d/debian-extra.list 
apt update && apt install -y intel-media-va-driver-non-free i965-va-driver vainfo
