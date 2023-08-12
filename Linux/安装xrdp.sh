# xrdp与VNC可以提供我们使用Windows远程访问Linux桌面界面，工作上一般只有在挂载窗口应用时会用到
# 查看是否有监听xrdp默认的3389端口（防火墙或云服务器要开启端口准入）
netstat -tunlp|grep 3389
# 安装VNC
yum -y install tigervnc-server
# 启动vnc服务
service vncserver start
# 【可选】设置成开机启动
chkconfig vncserver on
# 安装xrdp
yum -y install xrdp
# 启动xrdp()
systemctl start xrdp
# 图文参阅https://blog.csdn.net/sgrrmswtvt/article/details/81869208

# 【可选】离线安装xrdp
wget http://jaist.dl.sourceforge.net/project/xrdp/xrdp/0.6.1/xrdp-v0.6.1.tar.gz
tar -zxvf xrdp-v0.6.1.tar.gz
cd xrdp-v0.6.1
yum install -y autoconf automake libtool openssl openssl-devel pam-devel libX11-devel libXfixes-devel
./bootstrap
./configure
make
make install
chmod 755 /etc/xrdp/xrdp.sh
/etc/xrdp/xrdp.sh start
# 图文参阅https://www.cnblogs.com/coxiseed/p/9855816.html

# 安装完毕后可以尝试使用Windows自带的mstc连接Linux系统，输入IP即可
# 如果无法连接可以尝试VNCVIEWER，官方下载地址为https://www.realvnc.com/en/connect/download/viewer/