# 时间同步（粗暴修改时间）
ntpdate -u cn.pool.ntp.org

# 192.168.100.1会有一个ntpd服务端，用于给ntpdate服务客户端校时，如果服务端没有ntpd服务或者没有运行以下命令就会报错
/usr/sbin/ntpdate 192.168.100.1

# 启动ntpd服务。注意：启动后服务端本身就无法进行校时了，服务端如果想要校时则需要关闭ntpd服务
service ntpd start

# 系统时间自动同步配置（内网）

# 修改ntp.conf
vim /etc/ntp.conf
# 注释去掉，修改指定网段IP可访问本机ntpd服务
restrict 192.168.10.0 mask 255.255.255.0 nomodify notrap
# 注释外网公共事件服务器地址
# server 0.centos.pool.ntp.org iburst
# server 1.centos.pool.ntp.org iburst
# server 2.centos.pool.ntp.org iburst
# server 3.centos.pool.ntp.org iburst
# 当该节点丢失网络连接，依然可以采用本地事件作为时间服务器为集群中的其他节点提供时间同步
server 127.127.1.0
fudge 127.127.1.0 stratum 10
# 保存退出
:wq!

# 修改/etc/sysconfig/ntpd文件
vim /etc/sysconfig/ntpd
# 添加以下内容，让硬件时间与系统事件一起同步
SYNC_HWCLOCK=yes
# 重启ntpd服务
service ntpd restart
# 保存退出
:wq!