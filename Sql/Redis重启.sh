注意：想要停止Redis禁止使用kill会使数据丢失。
要想停止和启动Redis需要先找的Redis的目录，先使用“ps -ef|grep redis”命令，找到Redis的进程，一般看可以看到Redis的目录。（已知目录跳过这一步）
进入到对应的Redis的目录中。
停止Redis
无密码
./src/redis-cli   shutdown
有密码（密码123）
./src/redis-cli -a 123  shutdown
启动Redis
./src/redis-server ./redis.conf
原文链接：https://blog.csdn.net/Lin_Miao_09/article/details/92803966