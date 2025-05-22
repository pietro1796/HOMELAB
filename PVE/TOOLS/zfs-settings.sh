echo "$[4 * 1024*1024*1024]" >/sys/module/zfs/parameters/zfs_arc_max
options zfs zfs_arc_max=4294967296
