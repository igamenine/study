# CenOS6.5 以上 至 RedHad6.5以上
systemctl status firewalld    # 查看firewall服务状态
firewall-cmd --state          # 查看firewall状态
service firewalld start       # 开启firewall服务状态
firewall-cmd --reload         # 修改设置后要重启防火墙
 
 
 
firewall-cmd --query-port=80/tcp      # 查询端口是否开放
firewall-cmd --zone=public --add-port=80/tcp --permanent     # 开放80端口
firewall-cmd --permanent --remove-port=80/tcp  # 移除端口
 
firewall-cmd --permanent --list-ports # 查看防火墙的开放的端口
firewall-cmd --list-all   #查看防火墙规则

# CenOS6.5 以下 至 RedHad6.5以下
service iptables status   # 查看防火墙状态
iptables -L -n     # 使用命令查看端口开启情况
iptables -F        # 清除预设表filter中的所有规则链的规则
iptables -X        # 清除预设表filter中使用者自定链中的规则
/etc/rc.d/init.d/iptables save   # 保存以后下次重启才会开启
service iptables restart        # 重启一下防火墙
 
 
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
 
/etc/rc.d/init.d/iptables save
service iptables restart        # 重启一下防火墙
iptables -D INPUT -p tcp --dport 443 -j ACCEPT
iptables -D OUTPUT -p tcp --dport 443 -j ACCEPT
iptables -L -n
/etc/rc.d/init.d/iptables save
service iptables restart        # 重启一下防火墙


# 云服务器防火墙端口启用准入和关闭请打开对应的服务控制台操作