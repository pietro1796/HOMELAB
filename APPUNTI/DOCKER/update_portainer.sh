#bash -c "$(curl -fsSL https://raw.githubusercontent.com/pietro1796/HOMELAB/refs/heads/main/debian.sh)"
docker stop portainer
docker rm portainer
docker pull portainer/portainer-ce:lts
docker run -d -p 9000:9000 -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts
