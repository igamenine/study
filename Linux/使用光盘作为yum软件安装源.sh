首先插入光驱(虚拟机直接挂载），并挂载到文件系统中来
# 挂载光驱
mkdir /media/cdrom
mount /dev/cdrom /media/cdrom
然后到yum的源配置文件路径
cd /etc/yum.repo.d/
这个目录下默认应该有很多文件，这些文件中CentOS-Media.repo就是和光驱有关的源，将这个文件保留，其他文件都重命名一下（不要以repo为后缀名即可）。
这个时候，yum的源就只剩下光驱的源了，CentOS-Media.repo
接下来就可以安装软件了。
#搜索安装包
1.  yum --disablerepo=\* --enablerepo=c7-media install gcc

2.  yum --disablerepo=\* --enablerepo=c7-media groupinstall "Development Tools"其中，--enablerepo=c7-media的含义是，启用光盘作为源，而c7-media是在CentOS-Media.repo文件中以中括号括起来的内容。
--disableplugin=fastmirror的含义是，yum默认启用了fastmirror这个插件，它会读取镜像列表，并找到连接速度最快的mirror来作为软件源，但是我们当前不能联网，所以要禁用这个插件。
还有一个参数--disablerepo=base，和--enablerepo正好相反，是指将指定的源禁用，如果用这个参数，前面将repo后缀改名这一步就可以不用做了，但是一个repo文件里面可能有多个repo，那样的话参数会比较长，所以还是采用改名的方法直接。
此时就可以使用上面的命令，正常使用yum来安装已经存在于光盘中的软件包了。
当以后可以上网时，将前面改过名的文件改回去，就可以了。
如果/etc/yum.repo.d/文件夹下没有CentOS-Media.repo文件，那么只要手动创建一个就可以了，内容如下（以CentOS-6.3为例）
[c7-media]
name=CentOS-$releasever - Media
baseurl=file:///media/CentOS/
               file:///media/cdrom/
               file:///media/cdrecorder/
gpgcheck=0
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
安装完成后，弹出光驱
# 弹出光驱前先停止挂载
umount /media/cdrom
