错误信息内容如下：

ORA-03113: end-of-file on communication channel

Process ID: 11564

Session ID: 191 Serial number: 3

--以上错误信息一般为闪回区目录满了，解决办法我们选择最简单直接的方法：

解决办法：

sqlplus / as sysdba;

startup nomount;

alter database mount; --打开数据到mount状态

然后通过命令方式进入rman操作界面：

rman target /

crosscheck archivelog all; --检查控制文件和实际物理文件的差别

delete expired archivelog all; --同步控制文件的信息和实际物理文件的信息

alter database open; --打开数据库，然后就会成功了