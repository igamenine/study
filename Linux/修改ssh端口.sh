Vim /etc/ssh/sshd_config
# 将你想要修改的端口写进空行里： Port 端口号
# wq!
Systemctl restart sshd
# 注：可以添加多个端口，即允许保留22端口以备某些写死端口的软件使用