一，环境配置
1，安装环境：
虚拟机contos7.5 作PXEserver IP：192.168.99.3  配置 略；

关闭防火墙和selinux；

Systemctl stop firewalld; systemctl disable firewalld

Setenforce 0 ;vim /etc/selinux/config.  disable

2，软件环境：
contos7.5镜像 ：CentOS-7-x86_64-DVD-1804.iso 上传至 /app目录

 yum 安装 ：dhcp tftp-server xinetd vsftpd syslinux httpd

二，安装配置过程
1，配置静态ip：vim /etc/sysconfig/network- scripts/enp0s3
NAME="enp0s3"
DEVICE="enp0s3"
ONBOOT=yes
NETBOOT=yes
UUID="4c2cdc19-aba3-4682-b68d-c8d5a64f5eaf"
IPV6INIT=yes
BOOTPROTO=none
TYPE=Ethernet
IPADDR=192.168.99.3
NETMASK=255.255.255.0
GATEWAY=192.168.99.1
2，安装配置dhcp服务
yum install -y dhcp

vim /etc/dhcp/dhcpd.conf

default-lease-time 600;
max-lease-time 7200;

subnet 192.168.99.0 netmask 255.255.255.0 {
 option routers             192.168.99.3;
 option subnet-mask         255.255.255.0;
# option domain-name-servers 192.168.99.3;

 option time-offset              -18000; # Eastern Standard Time
 range dynamic-bootp 192.168.99.50 192.168.99.200;
 default-lease-time 21600;
 max-lease-time 43200;

}

option space PXE;
option PXE.mtftp-ip    code 1 = ip-address;
option PXE.mtftp-cport code 2 = unsigned integer 16;
option PXE.mtftp-sport code 3 = unsigned integer 16;
option PXE.mtftp-tmout code 4 = unsigned integer 8;
option PXE.mtftp-delay code 5 = unsigned integer 8;
option architecture-type code 93 = unsigned integer 16; # RFC4578

class "pxeclients" {
 match if substring(option vendor-class-identifier, 0, 9) = "PXEClient";
 next-server 192.168.99.3;
# if option pxe-system-type = 00:02 {
#  filename "ia64/elilo.efi"; #x86_64 UEFI引导
# } else 
 if option architecture-type = 00:07 or option architecture-type = 00:09 {
  filename "bootx64.efi"; 
 } else {
  filename "pxelinux.0"; #传统LEGACY引导
 }
}

systemctl start dhcpd; systemctl enable dhcpd   #启动和开机启动

3，安装配置httpd服务
yum install -y httpd    #httpd的工作目录是/var/www/html/

mkdir -p /var/www/html/centos7.5

mkdir -p /var/www/html/ks

systemctl start httpd systemctl enable httpd    #启动和开机启动

4，安装配置ftp和syslinux服务
yum install -y tftp-server vsftpd xinetd  syslinux

find / -name pxelinux.0 #查找pxelinux.0的网络引导文件

vim /etc/xinetd.d/tftp #配置ftp

service tftp
{
        socket_type             = dgram
        protocol                = udp
        wait                    = yes
        user                    = root
        server                  = /usr/sbin/in.tftpd
        server_args             = -s /var/lib/tftpboot
        disable                 = no    #把yes改成no
        per_source              = 11
        cps                     = 100 2
        flags                   = IPv4
}
systemctl restart vsftpd xinetd;  systemctl enable vsftpd xinetd ;

5，挂载光盘镜像CentOS-7-x86_64-DVD-1804.iso #目录/app/
mkdir /app/cdrom #创建挂载目录

mount /app/CentOS-7-x86_64-DVD-1804.iso  /app/cdrom/

6，拷贝相关文件
cp /usr/share/syslinux/pxelinux.0 /var/lib/tftpboot/ #复制pxelinux.0 到ftp根目录/var/lib/tftpboot/
cp /app/cdrom/images/pxeboot/initrd.img /var/lib/tftpboot/  #复制安装镜像到ftp根目录
cp /var/www/html/centos7/isolinux/vesamenu.c32 /var/lib/tftpboot/  #复制菜单文件到ftp根目录
cp /app/cdrom/images/pxeboot/vmlinuz /var/lib/tftpboot/   #复制内核文件到ftp根目录
cp -r /app/cdrom/* /var/www/html/centos7/ #将光盘镜像复制到httpd目录，需提前创建centos7目录：mkdir /var/www/html/centos7
7,创建配置文件default
mkdir pxelinux.cfg

Cd /var/lib/tftpboot/pxelinux.cfg

vim default 修改配置文件如下#需要删除注释文件

default vesamenu.c32

timeout 15

display boot.msg

label linux

  menu label ^Install CentOS 7 wu /app

  menu default

  kernel vmlinuz

  append initrd=initrd.img inst.repo=http://192.168.99.10/centos7.5 ks=http://192.168.99.10/ks/ks-no-app-leg.cfg  text net.ifnames=0 biosdevname=0

label linux

  menu label ^Install OS7 gen 200G

  kernel vmlinuz

  append initrd=initrd.img inst.repo=http://192.168.99.10/centos7.5 ks=http://192.168.99.10/ks/ks-200-app-leg.cfg  text net.ifnames=0 biosdevname=0



label linux

  menu label ^Install CentOS more

  kernel vmlinuz

  append initrd=initrd.img inst.repo=http://192.168.99.10/centos7.5 net.ifnames=0 biosdevname=0 

 menu end




grub.cfg  #util启动的方式的引导文件 /var/lib/tftpboot/ #文件目录  需要bootx64.efi 引导文件 ：
bootx64.efi.zip

#set default="0"

set default="0"



function load_video {

  insmod efi_gop

  insmod efi_uga

  insmod video_bochs

  insmod video_cirrus

  insmod all_video

}



load_video

set gfxpayload=keep

insmod gzio

insmod part_gpt

insmod ext2



set timeout=3

### END /etc/grub.d/00_header ###



search --no-floppy --set=root -l 'CentOS 7 x86_64'



### BEGIN /etc/grub.d/10_linux ###

menuentry 'Install CentOS 7 no app' --class fedora --class gnu-linux --class gnu --class os {

linuxefi (tftp)/vmlinuz ks=http://192.168.99.10/ks/ks-no-app-efi.cfg ksdevice=bootif lang= text lang= text net.ifnames=0 biosdevname=0 inst.gpt kssendmac ipv6.disable=1

initrdefi (tftp)/initrd.img

}



menuentry 'Install CentOS 7 200 app' --class fedora --class gnu-linux --class gnu --class os {

        linuxefi (tftp)/vmlinuz ks=http://192.168.99.10/ks/ks-200-app-efi.cfg ksdevice=bootif lang= text lang= text net.ifnames=0 biosdevname=0 inst.gpt kssendmac ipv6.disable=1

        initrdefi (tftp)/initrd.img

}



menuentry 'Install CentOS 7' --class fedora --class gnu-linux --class gnu --class os {

        linuxefi (tftp)/vmlinuz net.ifnames=0 biosdevname=0 inst.gpt kssendmac ipv6.disable=1

        initrdefi (tftp)/initrd.img

}

8，配置自动化配置文件ks.cfg 存放目录/var/www/html/ks/
#version=DEVEL
# System authorization information
auth --enableshafow --passalgo=sha512
# Install OS instead of upgrade
install
# Use CDROM installation media
#cdrom
# Use network installation
url --url="http://192.168.99.3/centos7" #centos镜像源 修改IP为本机IP
# Use graphical install#文本安装
text
# Firewall configuration #关闭firewalld和selinux 
firewall --disable
selinux --disable
firstboot --disable
# Run the Setup Agent on first boot
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us' #键盘
# System language
lang en_US.UTF-8 #语言
# Network information #网络设置
#network  --bootproto=dhcp --device=enp0s3 --ipv6=auto --activate
#network  --bootproto=dhcp --device=enp0s8 --onboot=off --ipv6=auto --activate
#network  --hostname=pxelinux
# Root password  #用户密码 已设置成 root和通用密码gexin
rootpw --iscrypted $6$5Xcf1e3GSlVHDkkE$1IwZ.Qb69BsjDB3mpVUu3QjgH0OHZFaNZKc44hAeNaJYfrIo4vMk/wdMjJFaNk84IupoKpvadD2Dq.VC6lKbX.
# System services
services --disabled="chronyd"
# System timezone
timezone Asia/Shanghai --isUtc --nontp
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda
# Partition clearing information
clearpart --all --initlabel #格盘信息
# Disk partitioning information  #分区信息
part / --fstype="xfs" --ondisk=sda --size=10240 #跟分区单位M
part /app --fstype="xfs" --ondisk=sda --size=1 --grow #app分区1为剩下的
part /boot --fstype="xfs" --ondisk=sda --size=200   #boot分区 200M
part swap --fstype="swap" --ondisk=sda --size=4096  #swap 分区 4096M 注意单位
reboot  #安装完成后重启
#ignoredisk --only-use=sda
#part biosboot --fstype=biosboot --size=1
#part / --fstype=xfs --size=100000 --ondisk=sda --asprimary    #此为生产环境分区信息 跟分区 100G或者500G
#part swap --maxsize=4096 --size=4096 --ondisk=sda --asprimary  #swap 4096M
#part /app --fstype=xfs --grow --ondisk=sda --size=1   #/app为其余挂载
#part /boot/efi --fstype efi --size 200 --asprimary --ondisk sda #boot分区 200M
%packages
@^minimal  #最小化安装
@core
kexec-tools
%end
%addon com_redhat_kdump --enable --reserve-mb='auto'
%end
%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end
%post
cd /root
wget http://192.168.99.3/info/info.csv
SN=`dmidecode -t 1 | grep Serial | awk -F : '{print $2}' | awk -F  ' ' ' {print $1}'`
NETSN=`cat /proc/net/dev |awk '{i++;if(i>2){print $1}}'|awk -F ":" '{print $1}' | head -1`
IP=`grep $SN info.csv|awk -F , '{print $3}'`
HOSTNAME=`grep $SN info.csv|awk -F , '{print $2}'`
GATEWAY=`grep $SN info.csv|awk -F , '{print $5}'`
NETMASK=255.255.255.0
hostnamectl set-hostname $HOSTNAME
echo $IP  $HOSTNAME >> /etc/hosts
 sed -i 's/ONBOOT=no/ONBOOT=yes/g' /etc/sysconfig/network-scripts/ifcfg-$NETSN
 sed -i 's/BOOTPROTO=dhcp/BOOTPROTO=none/g' /etc/sysconfig/network-scripts/ifcfg-$NETSN
echo "IPADDR=$IP" >>/etc/sysconfig/network-scripts/ifcfg-$NETSN
echo "NETMASK=$NETMASK" >>/etc/sysconfig/network-scripts/ifcfg-$NETSN
echo "GATEWAY=$GATEWAY" >>/etc/sysconfig/network-scripts/ifcfg-$NETSN
%end
#注意：修改 ks.cfg 权限 chmod 644 /var/www/html/ks/ks.cfg

info.csv文件

    设备sn，hostname，ipaddr，掩码，网关
事例: anobiu1,ga-hadoop1,192.168.8.23,255.255.255.0,192.168.8.1,