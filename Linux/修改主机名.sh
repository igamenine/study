# 修改主机名
hostnamectl set-hostname [new_hostname]
echo [new_hostname] > /etc/hostname

# 有在虚拟机里测试过修改kernel.hostname，属于临时修改，重启后还是以hostname为准了，不知道物理机是不是这样，不敢试，下面的仅供学习参考，不要修改
# 就目前测试看来主机名称优先级大于内核名称
cat /proc/sys/kernel/hostname
sysctl kernel.hostname=[new_hostname]