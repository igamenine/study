# CentOS重装系统
#操作很危险建议先测试一遍，不推荐生产环境执行
Cd /
备份
tar -vcpzf backup.tgz / --exclude proc –exclude backup.tgz –exclude mnt –exclude sys –exclude media
还原
tar xvpfz backup.tgz -C /
mkdir proc
mkdir mnt
mkdir sys
mkdir media
最后一定要执行restorecon -Rv /
重启电脑 reboot
