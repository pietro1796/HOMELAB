# https://pve.proxmox.com/wiki/ZFS_on_Linux#sysadmin_zfs_limit_memory_usage
# SET MAX ARC-SIZE THIS BOOT
echo "$[4 * 1024*1024*1024]" >/sys/module/zfs/parameters/zfs_arc_max
# SET MAX ARC-SIZE FOREVER
sed -i '/^\s*options\s\+zfs\s\+zfs_arc_max=/c\options zfs zfs_arc_max=4294967296' /etc/modprobe.d/zfs.conf || echo 'options zfs zfs_arc_max=4294967296' | tee -a /etc/modprobe.d/zfs.conf
