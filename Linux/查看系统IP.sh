# 只显示所有在用IP，简洁高效
hostname -I

ifconfig
# /sbin/config
# /sbin/ifconfig -a
# 如果你不确定你要找哪一个设备，那你要找到的设备很可能接入了端口“eth0”
ifconfig eth0
# 只显示IP相关
ifconfig|grep inet

ip addr show
# 如果你不确定你要找哪一个设备，那你要找到的设备很可能接入了端口“eth0”
ip addr show eth0
# 只显示IP相关
ip addr show|grep inet
