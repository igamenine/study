# CentOS会默认将/tmp中的文件定时清理，
# /tmp 目录的清理规则主要取决于 / usr/lib/tmpfiles.d/tmp.conf 文件的设定，
# 你也可以往配置文件中添加自己的日志目录，他会自动前往清理。
# v 目录名称 权限 用户 用户组 修改日期超过当前时间
v /tmp 1777 root root 10d #清理/tmp下10天前的目录和文件
# x 文件白名单
x /tmp/tomcat.* #保留前缀为tomcat的文件
