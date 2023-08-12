#1、拉取官方mysql镜像 如有防火墙请开启对应端口
docker pull mysql
#2、创建容器，可自定义root密码 MYSQL_ROOT_PASSWORD：密码初始化
docker run -itd --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw mysql
#3、查看容器是否创建并运行，如果没有则执行docker start mysql
docker ps -a
#4、进入容器
docker exec -it mysql /bin/bash
# 查看my.cnf存放路径
mysql --help|grep my.cnf
