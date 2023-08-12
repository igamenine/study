#1、拉取hive镜像 如有防火墙请开启对应端口
git clone https://github.com/big-data-europe/docker-hive.git
cd docker-hive-master
#2、创建容器
docker-compose up -d
#3、查看是否有容器未开启，如果没有则执行docker-compose start [容器名]
docker-compose ps
#4、进入容器
docker-compose exec hive-server bash
#5、开启hive（不一定能连接成功，原因待查）
/opt/hive/bin/beeline -u jdbc:hive2://localhost:10000
#6、测试sql语句
CREATE TABLE pokes (foo INT, bar STRING); 
LOAD DATA LOCAL INPATH '/opt/hive/examples/files/kv1.txt' OVERWRITE INTO TABLE pokes;  # 查询 select * from pokes;
