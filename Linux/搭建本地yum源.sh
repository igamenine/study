# 如今不推荐搭建本地yum源，如果需要可以通过docker维护自己的centos。本方法是通过挂载本地镜像的方式映射成本地源
cd /etc/yum.repos.d/
# 查看CentOS-Media.repo中的file路径
cat CentOS-Media.repo
# 将镜像挂载到上面查到的路径
mount -t iso9660 /dev/cdrom /media/cdrom
# 安装服务
yum --disablerepo=\* --enablerepo=c6-media install gcc
yum --disablerepo=\* --enablerepo=c6-media groupinstall "Development Tools"
# 如果只有唯一本地源，则需要刷新缓存（将老repo都移走的情况下）
yum makecache
# 如果想新建repo配置
mount /dev/cdrom /mnt
touch Base.repo
vim Base.repo
# 将如下内容填入Base.repo
[base]
name=base
baseurl=file:///mnt
enable=1
gpgcheck=0

# 使用httpd使本地yum源对外提供服务
yum -y install httpd
mount /dev/cdrom /mnt
rmdir /var/www/html
ln -s /mnt/ /var/www/html
systemctl start httpd
# 页面访问ip/Packages

# 按分组安装环境包
yum grouplist
yum groupinstall [上面查询到的分组名称]