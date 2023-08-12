#开机启动或关闭自启
#systemctl
systemctl enable/disable [服务名]
# 开机启动并马上启动
systemctl enable/disable [服务名] --now
#chkconfig
chkconfig --level 3 [服务名] on/off
# rc.local
vim /etc/rc.d/rc.local
# 末尾添加类似以下参数
/usr/src/tomcat/bin/startup.sh

#服务状态
#systemctl
systemctl status [服务名]
#service
service [服务名] status

#已开启的服务清单
#systemctl
systemctl list-units --type=service
#chkconfig
chkconfig --list

#启动或停止或重启服务
#systemctl
systemctl start/stop/restart [服务名]
#service
service [服务名] start/stop/restart

