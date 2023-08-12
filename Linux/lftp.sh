# Linux系统使用ftp服务可以安装lftp。 yum -y 所有问题都回答“是”
yum -y install lftp
# 关闭证书验证，解决“Certificate verification: Not trusted”报错
vim /etc/lftp.conf
# 往配置文件中添加以下参数，不需要重启
set ssl:verify-certificate no
# 连接方式1
lftp ftp_test:ftptest@node1:801
# 连接方式2
lftp -u ftp_test,ftptest node1 -p 801
# 连接方式3（密码不显示输入）
lftp node1:801
login ftp_test
# 查看目录文件
ls
# 打开目录
cd dir_name
# 下载文件，会下载到当前目录，如果当前目录有同名文件则自动取消下载
get test.txt
mget -c *.pdf
#将aaa目录整个的下载下来，子目录也会自动复制。
mirror aaa/
# 上传目录
mirror -R aaa/
# 上传文件
put test.txt
mput *.txt
# 删除文件
rm file1[ file2..]
# 删除目录
rm -r dir/
删除目录下的文件
rm -rf dir/*.txt


# 【可选】往/etc/lftp.conf添加以下参数解决中文乱码的问题
set ftp:charset gbk
set file:charset utf8
set pget:default-n 5


# 转自https://linux.cmsblogs.cn/c/lftp.html
# 图文参考https://www.cnblogs.com/pandachen/p/5373204.html