# 一般是Centos最小化安装没有考虑到用户使用ifconfig查询网络配置的情况，我们可以使用如下命令安装网络查询服务
yum install net-tools
# net-tools安装好后，即可以使用如下命令
1.ifconfig：查询、设置网卡与IP网络等相关参数
2.ifup、ifdown：启动与关闭网络接口
3.route：查看、配置路由表
4.ip：整合式命令，可以直接修改各种参数
5.ping
