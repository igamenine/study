
vim /etc/ssh/sshd_config
# 白名单
# 允许 aliyun 和从 192.168.1.1 登录的 test 帐户通过 SSH 登录系统。
AllowUsers    aliyun test@192.168.1.1
# 黑名单
# 拒绝 zhangsan、aliyun 帐户通过 SSH 登录系统
DenyUsers    zhangsan aliyun

# 重启服务
service sshd restart