# 白名单
vim /etc/hosts.allow
sshd:192.168.0.1:allow  #允许 192.168.0.1 这个 IP 地址 ssh 登录
sshd:192.168.0.1/24:allow #允许 192.168.0.1/24 这段 IP 地址的用户登录
sshd:ALL # 允许全部的 ssh 登录 

# 黑名单
vim /etc/hosts.deny
sshd:192.168.0.1:deny  #禁止 192.168.0.1 这个 IP 地址 ssh 登录
sshd:192.168.0.1/24:deny #禁止 192.168.0.1/24 这段 IP 地址的用户登录
sshd:ALL # 禁止全部的 ssh 登录

# 优先级：/etc/hosts.allow大于/etc/hosts.deny
# 重启服务
service sshd restart