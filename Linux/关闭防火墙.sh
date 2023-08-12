# 启动： systemctl start firewalld
关闭： systemctl stop firewalld
查看状态： systemctl status firewalld 
开机禁用  ： systemctl disable firewalld
# 开机启用  ： systemctl enable firewalld
# 修改/etc/selinux/config文件中的SELINUX=””为disabled，然后重启。
vim /etc/selinux/config
SELINUX="disabled"