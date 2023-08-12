# 这里要明确三个方式的区别：
# 卸载- 用于硬盘（卸载后可以重新装载）
# 弹出- 一般用于DVD光驱（会物理弹出设备)，弹出硬盘/U盘会单独弹出分区而不是整个设备。
# 安全移除- 用于需要同步和断电的 USB 驱动器（例如笔式驱动器）（U盘）
# 更多参见https://askubuntu.com/questions/5845/what-is-the-difference-between-unmount-eject-safely-remove-drive-and-the

# 弹出U盘（分区）
gio mount -e /run/media/donhost/[U盘名称]

# 安全移除（推荐）
udisksctl unmount -b /dev/sdc1
udisksctl power-off -b /dev/sdc1
# 更多参见https://blog.csdn.net/qq_37227125/article/details/94882056



