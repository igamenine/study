# Linux特殊文件权限有三个玩意：sticky bit、SGID、SUID，以下一一道来。

# 0、SELinux的安全上下文
# 除了上面提到的3个特殊文件权限类型，还有一个会在文件权限结尾标“.”号的权限，它表示SELinux的安全上下文，即被SELinux标记过的文件（目录），如果重启SELINUX会自动为没添加的文件（目录）添加，目前用途待研究，关闭SELINUX后生成的文件（目录）不会再有此标记。
# 赋权方法：
vim /etc/selinux/config
SELINUX="disabled"
restart
# 拥有此特殊权限的/tmp目录权限详细展示情况：
drwxrwxrwt. 10 root root 4096 Sep 19 16:39 tmp


# 1、sticky bit(黏性位)
# 文件可以给任何人读写，但只能有文件拥有者删除，比如系统默认的/tmp目录。
# 权限标识符是t，如果是T则表示已添加没生效，原因是other没有写的权限。
# 赋权方法：
chmod o+t /tmp
chmod 1777 /tmp
# 拥有此特殊权限的/tmp目录权限详细展示情况：
drwxrwxrwt. 10 root root 4096 Sep 19 16:39 tmp


# 2、SGID(The Set GroupID)
# 文件运行这个程序时，是临时以这个文件的拥有组的身份运行，比如系统默认的/usr/bin/ssh-agent。
# 权限标识符是S，如果是T则表示已添加没生效，原因是group没有执行的权限。
# 赋权方法：
chmod g+s /usr/bin/ssh-agent
chmod 2777 /usr/bin/ssh-agent
# 拥有此特殊权限的/tmp目录权限详细展示情况：
---x--s--x. 10 root root 382240 Sep 19 16:39 /usr/bin/ssh-agent


# 3、SUID
# 文件运行这个程序时，是临时以这个文件的拥有者的身份运行，比如系统默认的/bin/passwd。
# 权限标识符是S，如果是T则表示已添加没生效，原因是group没有执行的权限。
# 赋权方法：
chmod o+s /bin/passwd
chmod 4777 /bin/passwd
# 拥有此特殊权限的/tmp目录权限详细展示情况：
-rwsr-xr-x. 10 root root 27832 Sep 19 16:39 /bin/passwd

#   SUID：置于 u 的 x 位，原位置有执行权限，就置为 s，没有了为 S .
#   SGID：置于 g 的 x 位，原位置有执行权限，就置为 s，没有了为 S .
#   STICKY：粘滞位，置于 o 的 x 位，原位置有执行权限，就置为 t ，否则为T .


# 转自https://blog.csdn.net/weiling_shen/article/details/7577571
# 更多参见http://c.biancheng.net/view/870.html