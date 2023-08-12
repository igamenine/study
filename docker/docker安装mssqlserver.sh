#1、拉取sqlserver镜像 如有防火墙请开启对应端口
docker pull alexk002/sqlserver2019_demo:1
#2、创建容器，可自定义sa密码 MYSQL_ROOT_PASSWORD：密码初始化
docker run -d -p 1433:1433 -e SA_PASSWORD=OcP2020123 --name sqlserver alexk002/sqlserver2019_demo:1
# 默认参数ACCEPT_EULA (Default=Y) SA_PASSWORD (Default =OcP2020123) MSSQL_PID (Default=Developer) MSSQL_AGENT_ENABLED (DEFAULT=True)
#3、查看容器是否创建并运行，如果没有则执行docker start sqlserver
docker ps -a
#4、进入容器
docker exec -it sqlserver /bin/bash

