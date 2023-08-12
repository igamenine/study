# 当我们在架设高可用服务器环境时会遇到来自于系统级别的连接数限制问题(too many open files)，这是因为CentOS根据系统硬件信息自己默认初始了一个限制连接数量，往往这个数量是我们遇到的问题，所以今天我们需要修改系统的默认值来达到我们需要的要求，解决一定的高并发产生的连接数问题。
# 查看当前最大连接数
ulimit -n
# 修改连接数
vim /etc/security/limits.conf
# 添加以下内容
* soft nofile 100001
* hard nofile 100002
root soft nofile 100001
root hard nofile 100002
* soft nofile 100001
* hard nofile 100002
root soft nofile 100001
root hard nofile 100002
* soft memlock unlimited
* hard memlock unlimited
# 添加认证文件
vim /etc/pam.d/login
# 添加以下内容
session    required     pam_limits.so
# 重启服务器
reboot
# 查看当前最大连接数
ulimit -n

# 关于句柄设置有坑，详细参看https://blog.csdn.net/vic_qxz/article/details/82817065