# 1、通过互联网环境使用yum下载服务及依赖包
mkdir rpmpath
yum install openssl --downloadonly --downloaddir=rpmpath
# 2、将rpmpath目录拷贝到离线环境并在离线环境打开安装
# -i 安装包 -v 显示附加信息 -h 安装时输出进度条标记(#)
cd rpmpath
rpm -ivh *.rpm

# 查找已安装的包
rpm -qa 包名

# 查找文件关联的包
rpm -qf 文件路径