1)对于.zip

linux下提供了zip和unzip程序，zip是压缩程序，unzip是解压程序。它们的参数选项很多，可用命令zip -help和unzip -help查看，这里只做简单介绍，举例说明一下其用法：


# 加密压缩
# https://www.cnblogs.com/LIAOBO/p/13895344.html
# -P加密    linux，不兼容mac
zip -r -P T09j03x# 20230813.zip inc_day\=阿里巴巴永世长存
# -P指定密码
unzip -o -P T09j03x# 20180109.zip -d /home/sfapp/tianjin/fengtu_rst/rst


# 带密码 到时候解压密码错误的话试试最后加/ macOS
zip -r -P 20221014 asmrpw20221014.zip asmrpw20221014
zip -er RJ01078989.part7.zip RJ01078989.part7.rar
# zip test.zip test.jpg test.png
这条命令是将test.jpg和test.png压缩成一个zip包
# zip test.zip *.jpg
这条命令是将所有.jpg的文件压缩成一个zip包
# zip -r test.zip test
这条命令是将文件夹test压缩成一个zip包
# unzip test.zip
这条命令是将test.zip中的所有文件解压出来
　把/home目录下面的mydata目录压缩为mydata.zip
　# zip -r mydata.zip mydata #压缩mydata目录
　把/home目录下面的mydata.zip解压到mydatabak目录里面
　# unzip mydata.zip -d mydatabak
 
2)对于.rar

安装： sudo apt-get install rar unr

或者可从http://www.rarsoft.com/download.htm下载 RAR for Linux 编译安装
# tar -xzpvf rarlinux-3.8.0.tar.gz
# cd rar
# make
这样就安装好了，安装之后就有了rar和unrar这两个程序，rar是压缩程序，unrar是解压程序。它们的参数选项很多，可用命令rar -help和unrar -help查看，这里亦简单举例说明一下其用法：

# rar a test.rar test.jpg test.png
这条命令是将test.jpg和test.png压缩成一个rar包
# rar a test.rar *.jpg
这条命令是将所有.jpg的文件压缩成一个rar包
# rar a test.rar test
这条命令是将文件夹test压缩成一个rar包
# unrar e test.rar
这条命令是将test.rar中的所有文件解压出来
