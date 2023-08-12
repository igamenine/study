# 停止服务
systemctl stop zabbix-server
systemctl stop httpd
systemctl stop zabbix-java-gateway
# 导出系统库
mysqldump -u root -p  zabbix > /home/zabbix_20220714.sql
# 导入数据库
mysql -u root –p -h 192.168.100.1 -P 3306 zabbix < 备份文件.sql
# 更改/etc/zabbix/zabbix_server.conf中db连接
DBHost=192.168.100.1
DBSocket=/tmp/mysql.sock
# 需要注意的一点是若DBhost设置为localhost，那么zabbix会自动将DBsocket设置为/var/lib/mysql/mysql.sock，若你的mysql的socket不在这个地方就将DBhost设置为ip地址。
# 更改/etc/zabbix/web/zabbix.conf.php文件中关于数据库的配置，也可在ip:端口/zabbix/setup.php中更改数据库连接地址。
vim /etc/zabbix/web/zabbix.conf.php
# 开启服务
systemctl start zabbix-server
systemctl start httpd
systemctl start zabbix-java-gateway