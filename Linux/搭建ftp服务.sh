# Linux下搭建ftp服务
# 图文参考https://www.cnblogs.com/freeweb/p/6518257.html
# 查看vsftpd服务安装情况
rpm -qa | grep vsftpd
# 如果没有则安装（离线环境下自己找安装包）
yum -y install vsftpd
# 添加ftp用户（自定义名称，建议当作目录名使用）
useradd -s /sbin/nologin -d /home/ftp_test ftp_test
passwd ftp_test

# 修改默认配置文件（按需修改完毕后记得保存退出wq!）
vim /etc/vsftpd/vsftpd.conf
# 不允许匿名登录
anonymous_enable=NO

# 【可选】只允许查看ftp用户目录
chroot_local_user=YES

# 【可选】新增内容修改ftp端口号（默认21）（防火墙或云服务器要开启端口准入）
listen_port=801

# 修改PAM认证文件(按需修改完毕后记得保存退出wq!)
vim /etc/pam.d/vsftpd
# 注释以下配置（不注释会报“530 login incorrect”错误）
auth    required pam_shells.so

# 【可选】配置SSL加密参数（不配置连接ftp会明文传输容易被抓包泄露ftp密码及文件）
# 对服务版本有要求，如果是生产环境服务版本老旧的话请谨慎处理，这里不推荐贸然升级服务
# 让vsftpd支持SSL，必须让OPENSSL≥0.9.6版本，还有就是本身vsftpd版本是否支持
# 图文参考https://www.cnblogs.com/wish123/p/5447884.html
rpm -qa | grep openssl
# openssl-1.0.2k-21.el7_9.x86_64
# 除了opensssl版本限制，vsftpd要返回类似结果才可以
ldd /usr/sbin/vsftpd |grep libssl
# libssl.so.10 => /lib64/libssl.so.10 (0x00007fb355198000)
# 生成本地SSL证书 证书有效期默认一年，过期后要重新生成证书，有需要自己修改-days
# 执行命令后会询问你的个人信息用于生成rsa证书主题信息，不想填无脑回车就行了
openssl req -x509 -nodes -days 365 -newkey rsa:1024 \-keyout /etc/vsftpd/vsftpd.pem \-out /etc/vsftpd/vsftpd.pem
# 检查是否生成认证文件，如果有返回结果代表已生成
ll /etc/vsftpd/vsftpd.pem

# 修改默认配置文件（按需修改完毕后记得保存退出wq!）
vim /etc/vsftpd/vsftpd.conf

# 添加以下参数
# 启用SSL
ssl_enable=YES
# 不允许匿名登录
allow_anon_ssl=NO
# 非匿名用户传输数据时加密
force_local_data_ssl=YES
# 非匿名用户登录时加密
force_local_logins_ssl=YES
# 激活各项加密加密
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO
# rsa证书的位置
rsa_cert_file=/etc/vsftpd/vsftpd.pem

# 使用ipv4地址，解决“服务器发回了不可路由的地址。使用服务器地址代替的问题”错误
# 图文参考https://blog.csdn.net/bayaci/article/details/124855696
listen=YES
listen_ipv6=NO
# 添加以下参数
#开启被动模式
pasv_enable=YES
#被动模式端口范围，可自定义，需要大于1024（防火墙或云服务器要开启端口准入）
pasv_min_port=6000
pasv_max_port=6010
#需要加入外部ip，否则被动模式会失败，填写ftp服务器外网地址
pasv_address=39.96.38.179
pasv_addr_resolve=YES

# 启动vsftpd（防火墙或云服务器要开启端口准入）
service vsftpd start

# 查看服务运行状态，如果启动失败则留言告知
service vsftpd status

# Windows连接ftp方法
# 如果没有配置SSL加密：
# 图文参考https://jingyan.baidu.com/article/3a2f7c2e541b6867aed61172.html
# filezilla中点击文件-站点管理器-新建站点-填写连接信息-传输设置-传输模式选择【主动】，解决“读取目录列表失败”错误
# 如果有配置SSL加密：
# filezilla中点击文件-站点管理器-加密选择【如果可用，使用显式的FTP over TLS】
# 新建站点-填写连接信息-传输设置-传输模式选择【被动】，解决“连接超时 读取目录列表失败”错误
# Linux连接ftp方法
# Linux系统一般情况下可以直接使用scp命令传输文件，当然如果ftp服务端只提供ftp账号且有定时传输文件的需求的话则可以使用lftp，这里不展开赘述，工作中很少遇见，参见同目录下lftp.sh
# 如果还是无法连接请留言告知

# ftp与sftp的区别
# ftp是使用vsftpd实现的功能，端口自定义（默认端口21），sftp是使用ssh的功能实现的类似ftp效果的功能，本质上是ssh，走ssh端口和协议

