echo "deb http://deb.debian.org/debian trixie non-free
deb http://security.debian.org/debian-security trixie-security non-free
deb http://deb.debian.org/debian trixie-updates non-free" > /etc/apt/sources.list.d/debian-extra.list 
apt update && apt install -y intel-media-va-driver-non-free i965-va-driver vainfo
