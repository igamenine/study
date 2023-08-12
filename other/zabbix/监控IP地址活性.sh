# 安装fping
yum -y install fping
# 测试服务是否可用
fping www.baidu.com
fping 127.0.0.1
fping www.123.com
# 返回结果类似这种就代表可用
127.0.0.1 is alive
www.baidu.com is alive
www.123.com address not found
# 打开zabbix-configuration-host-creat host添加需要监控的ip地址，host name添加需要监控的ip地址，如下图所示：ip地址框为监控的ip，dns名称，端口等无需操作
# 2.选择模版template icmp ping
# 3.添加Graphs
# 图文参考https://blog.csdn.net/weixin_43279032/article/details/83054324


# 离线安装
wget http://www.fping.org/dist/fping-3.16.tar.gz
tar zxvf fping-3.16.tar.gz
cd fping-3.16
./configure --prefix=/usr/local/fping/
make && make install
# 则修改zabbix_server配置(默认路径为/usr/sbin/fping)
vim /etc/zabbix/zabbix_server.conf
FpingLocation=/usr/local/fping/sbin/fping
# 为fping赋权
chown root:zabbix /usr/local/fping/sbin/fping
chmod 4710 /usr/local/fping/sbin/fping
# 测试服务是否可用
/usr/local/fping/sbin/fping www.baidu.com
# 返回结果类似这种就代表可用
www.baidu.com is alive
# 打开zabbix-configuration-host-creat host添加需要监控的ip地址，host name添加需要监控的ip地址，如下图所示：ip地址框为监控的ip，dns名称，端口等无需操作
# 2.选择模版template icmp ping
# 3.添加Graphs
# 图文参考https://blog.csdn.net/weixin_43279032/article/details/83054324
