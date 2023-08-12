# 服务器安装centos7提示“No Caching mode page found”错误
[sdb] No Caching mode page found
[sdb] Assuming drive cache:write through
先移动到第二项test this media & Install Centos 7(按Tab键移动)然后进行编辑路径将
vmlinuz initrd=initrd.img inst.stage2=hd:LABEL=CentOS\x207\x20x86_64 quiet
改为
vmlinuz initrd=initrd.img linux dd quiet
然后按enter键，出现如下图的u盘信息

重启系统：使用ctrl+alt+del
再次重复上面的步骤 如下：
vmlinuz initrd=initrd.img inst.stage2=hd:LABEL=CentOS\x207\x20x86_64 quiet
改为
vmlinuz initrd=initrd.img inst.stage2=hd:/dev/sdb4（我自己的U盘盘符） quiet
按enter键等待安装程序启动，进行CentOS的安装即可
# 图文参考https://blog.51cto.com/u_13941177/2330112
# 或者在同目录下查看同名word文档