#修改前需要提前将用户切换至root。部分系统除了network还要检查networkmanager是否修改和开启，这个要注意，谨慎操作。
#  cd /etc/sysconfig/network-scripts
#  修改里面的ifcfg开头的文件（一般是修改外网IP，）.
# 名称	解释
DEVICE=eth0	DEVICE:物理设备   eth0表示物理设备(网卡)的名字
BOOTPROTO=static	BOOTPROTO:配置静态化  static:静态
BROADCAST=addr　　	BROADCAST:广播   addr表示广播地址
HWADDR=addr　　	HWADDR:硬件地址   addr:硬件地址
IPADDR=addr	IPADDR:软件地址   addr表示赋给该卡的IP地址
NETMASK=mask	NETMASK:网络掩码   mask表示网络掩码
NETWORK=addr	NETWORK:网络   addr表示网络地址
ONBOOT=yes/no	ONBOOT:要不要预设启动此介面   yes/no : yes为启动  no为不启动
# 修改完成后ifconfig查看是否成功更改 如果没有则重启network。
service network restart

# 如果重启network后网络异常，请关闭networkmanager，因为network和networkmanager是两个相互冲突的不同服务，理论上在你修改之前就要关闭它，否则请前往networkmanager修改IP
systemctl is-enabled NetworkManager
systemctl status NetworkManager
systemctl stop NetworkManager
systemctl disable NetworkManager
service NetworkManager stop
chkconfig NetworkManger off

# 如果网络在没有修改任何配置的情况下突然断网，那可能是网线问题，请先尝试更换网线测试后再进行配置修改的操作

# 如果无法连接网络，需要再配置一下DNS地址
vim /etc/resolv.conf
nameserver 114.114.114.114

# 互联网成功配置代码参考，主要就是改BOOTPROTO和添加IPADD-DNS2的部分
TYPE="Ethernet"
PROXY_METHOD="none"
BROWSER_ONLY="no"
BOOTPROTO="static"
DEFROUTE="yes"
IPV4_FAILURE_FATAL="no"
IPV6INIT="yes"
IPV6_AUTOCONF="yes"
IPV6_DEFROUTE="yes"
IPV6_FAILURE_FATAL="no"
IPV6_ADDR_GEN_MODE="stable-privacy"
NAME="enp0s3"
UUID="a5941e4a-d159-4c10-b0b5-97f556e18d8f"
DEVICE="enp0s3"
ONBOOT="yes"

IPADDR=192.168.20.113
NETMASK=255.255.255.0
GATEWAY=192.168.20.1
DNS1=114.114.114.114
DNS2=8.8.8.8

# 内网成功配置代码参考
TYPE="Ethernet"
BOOTPROTO=static
DEFROUTE=yes
NAME=eth0
DEVICE=eth0
ONBOOT=yes
IPADDR=192.168.41.206
NETMASK=255.255.255.0
GATEWAY=192.168.41.1