# POST-INSTALL-PVE
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/pve/post-pve-install.sh)"
# POST-INSTALL-DEBIAN
bash -c "$(curl -fsSL https://raw.githubusercontent.com/pietro1796/HOMELAB/refs/heads/main/debian.sh)"
# Set Max Map Count
echo 'vm.max_map_count=262144' | sudo tee -a /etc/sysctl.d/vm.max_map_count.conf
# ZFS-SETTINGS
bash -c "$(curl -fsSL https://raw.githubusercontent.com/pietro1796/HOMELAB/refs/heads/main/PVE/TOOLS/zfs-settings.sh)"
# GPU-SETTINGS
bash -c "$(https://raw.githubusercontent.com/pietro1796/HOMELAB/refs/heads/main/PVE/TOOLS/gpu-drivers.sh)"
