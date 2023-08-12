#1、拉取官方redis镜像  如有防火墙请开启对应端口
docker pull redis
#2、创建容器，如果要创建密码则需要配置redis.conf修改requirepass
docker run --name redis -d redis
#3、查看容器是否创建并运行，如果没有则执行docker start mysql
docker ps -a
#4、进入容器
docker exec -it redis /bin/bash
# 连接redis-cli
docker run -it --network some-network --rm redis redis-cli -h redis

# 您可以创建自己的 Dockerfile，将上下文中的 redis.conf 添加到 /data/ 中，如下所示。
FROM redis
COPY redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
# 或者，您可以使用选项指定与行相同的内容。docker run
docker run -v /myredis/conf:/usr/local/etc/redis --name myredis redis redis-server /usr/local/etc/redis/redis.conf
# 包含文件的本地目录在哪里。使用此方法意味着您不需要为 redis 容器设置 Dockerfile。/myredis/conf/redis.conf
# 映射的目录应该是可写的，因为根据配置和操作模式，Redis可能需要创建其他配置文件或重写现有配置文件。
# 更多信息可参考https://hub.docker.com/_/redis?tab=description