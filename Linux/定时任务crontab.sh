# crontab配置格式
* * * * * command
# minute hour day month week command
# 分 时 天 月 星期 命令
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * [user-name]  command
# 星号（*）：代表所有可能的值，例如month字段如果是星号，则表示在满足其它字段的制约条件后每月都执行该命令操作。
# 逗号（,）：可以用逗号隔开的值指定一个列表范围，例如，“1,2,5,7,8,9”。
# 中杠（-）：可以用整数之间的中杠表示一个整数范围，例如“2-6”表示“2,3,4,5,6”。
# 正斜线（/）：可以用正斜线指定时间的间隔频率，例如“0-23/2”表示每两小时执行一次。同时正斜线可以和星号一起使用，例如*/10，如果用在minute字段，表示每十分钟执行一次。
#crontab的基本单位是分钟，所以定时无法小于1分钟执行
#示例
*/10   *   *   *   * #每10分钟执行一次
*      *   *   *   *  #每1分钟执行一次
0 6-12/3 * 12 * #在 12 月内, 每天的早上 6 点到 12 点，每隔 3 个小时 0 分钟执行一次
0 17 * * 1-5 #周一到周五每天下午 5:00执行一次
20 0-23/2 * * * #每月每天的午夜 0 点 20 分, 2 点 20 分, 4 点 20 分....执行

# crontab命令用于设置周期性被执行的指令。该命令从标准输入设备读取指令，并将其存放于“crontab”文件中，以供之后读取和执行。
# 系统管理员可以通过cron.deny 和 cron.allow 这两个文件来禁止或允许用户拥有自己的crontab文件，在对应文件里填写用户名即可。
/etc/cron.deny #表示不能使用crontab 命令的用户
/etc/cron.allow #表示能使用crontab的用户。
# 默认情况下，cron.allow文件不存在。如果两个文件同时存在，那么/etc/cron.allow 优先。如果两个文件都不存在，那么只有超级用户可以安排作业。
# 每个用户自己的crontab配置文件会存放在/var/spool/cron目录下，文件名以用户名命名。
# linux的cron服务是每隔一分钟去读取一次/var/spool/cron,/etc/crontab,/etc/cron.d下面所有的内容.

# 检查crontab安装情况
rpm -qa|grep crontab
# crontab服务命令
/etc/init.d/crond stop/start/restart/reload
# crontab配置命令（一般是修改后即时生效）
crontab -e
# crontab查看命令
crontab -l
# crontab清理命令（会清理当前用户所有定时任务，慎用，如只想清楚某条记录，配置命令里使用dd即可）
crontab -r
#设置crond开机自动启动(推荐使用systemctl)
chkconfig --list crond / systemctl list-unit-files |grep crond
chkconfig --level 35 crond on / systemctl enable crond.service

# 按照秒单位执行的例子如下：
## For excuting scripts.sh every 3 seconds##on 2014-10-15
*/1 * * * *  /home/somedir/scripts.sh
*/1 * * * * sleep 3 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 6 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 9 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 12 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 15 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 18 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 21 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 24 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 27 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 30 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 33 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 36 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 39 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 42 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 45 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 48 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 51 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 54 &&  /home/somedir/scripts.sh
*/1 * * * * sleep 57 &&  /home/somedir/scripts.sh
#-----------------------------------------------------------------