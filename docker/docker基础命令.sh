# 安装docker
yum install -y docker
# 启动/关闭docker
service docker start/stop/status
# 打包项目至镜像 -t tag/标签 第一次会很慢，因为要下载build依赖。如果不写版本则为latest
# 注意：想要打包项目，项目根目录下必须有dockerfile配置文件，配置模板参见docker目录下dockerfile文件
docker build -t [REPOSITORY:version] [项目目录]
docker build -t my-finance:v1 .
# 导出镜像
docker save [image] -o [export_name].tar[.gz]
docker save [image] > [export_name].tar[.gz]
# 导入镜像
docker load < [export_name].tar[.gz]
docker load --input [export_name].tar[.gz]

# 开启容器 -p 映射端口（本机端口:容器内端口） -d detached/分离（后台运行） -v 挂载目录 本机目录:容器内目录 -e 设置环境变量
docker run -it centos sh # 启动新容器并开启sh终端，exie后停止容器
docker run --rm -it centos sh # 启动新容器并开启sh终端，exie后删除容器
docker run -p port:port -d [REPOSITORY]
docker run -p 80:5000 -d my-finance
docker run -d -p 1521:1521 --name oracle11g registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g
docker run -itd --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw mysql -v /etc/mysql:/etc/mysql
docker run -p 3306:3306 --name mysql -v /etc/mysql:/etc/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d 0ef9083d9892

# 运行容器并进入
docker run -it busybox /bin/sh

# 将容器提交为新镜像
docker commit [containername/containerid] [image:version]
docker commit -m "[comment]" -a "[author]" [containername/containerid] [image:version]

# 查看容器清单
# 注意：容器和镜像是不一样的概念，我们可以通过挂载本地目录将修改结果重启容器后呈现在运行的容器中，将最终的修改结果打包成静态镜像用于实施人员部署
# 查看启动的容器
docker ps
# 查看所有容器
docker ps -a

# 停止容器
docker stop [container id]

# 重启容器
docker restart [container id]

# 查询docker占用空间
docker system df
# 删除容器
docker rm [container id]
# 删除停止的容器（容器停止后不会自动删除，而且使用新的run命令会创建多个容器，造成资源浪费）
docker rm $(docker container ls -f 'status=exited' -q)
# 注意，这两个命令会把你暂时关闭的容器，以及暂时没有用到的Docker镜像都删掉
# 清理磁盘，删除关闭的容器、无用的数据卷和网络，以及dangling镜像（即无tag的镜像）
docker system prune
# 关闭的容器、无用的数据卷、网络、没有容器使用Docker镜像都删掉。
docker system prune -a
# 删除所有关闭的容器：
docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm
# 删除所有dangling镜像（即无tag的镜像）：
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
# 删除所有dangling数据卷（即无用的Volume）：
docker volume rm $(docker volume ls -qf dangling=true)



# 进入容器 -i :即使没有附加也保持STDIN 打开 -t :分配一个伪终端
# 其实严格来讲不叫进入，叫执行，只是执行了此命令后docker为我们开启了容器的终端，因为容器并不是虚拟机，所以从根本上说我们依旧是在宿主机上操作容器
docker exec -it [container id/names] /bin/bash
docker exec -it [container id/names] sh

# 删除镜像 已运行容器依赖的镜像不会被删除
docker rmi [镜像名称]:[版本] 
docker rmi python:3.8-slim-buster

# 创建数据卷
docker volume create [数据卷名称]
docker volume create my-finance-data

# 挂载数据卷（实际应用中我们通常使用绝对路径bind mount）
# 使用相对路径目录则会挂载到docker指定目录/var/lib/docker/volumes
docker run -dp 80:5000 -v my-finance-data:/etc/finance my-finance

# 拉取镜像（安装其他人的镜像）
docker pull python:3.8-slim-buster

# 查看容器日志 -f 日志实时输出 -t 显示时间戳
docker logs -f -t oracle11g

# 创建虚拟网络（多容器互通使用）
docker network create [虚拟网络名称]
docker network create prometheus-network
docker run -d --name redis --network test-net --network-alias redis redis:latest

# connect 将某个容器连接到一个docker网络
# create 创建一个docker局域网络
# disconnect 将某个容器退出某个局域网络
# inspect 显示某个局域网络信息及参数信息
# ls 显示所有docker局域网络
# prune 删除所有未引用的docker局域网络
# rm 删除docker网络——注意！删除网络之前请确认已将关联的容器disconnect掉，否则容器将会损坏！
docker network disconnect  prometheus-network oracle11g
docker netrwork rm prometheus-network
# 如果在解绑网络关系之前就将关联网络删除，可尝试修改容器的config.v2.json，然后重启容器
docker stop [容器名]
vim /var/lib/docker/containers/[container id]/config.v2.json
docker start [容器名]

# 修改容器配置文件
docker stop [容器名]
vim /var/lib/docker/containers/[container id]/config.v2.json
docker start [容器名]
# 图文参考https://juejin.cn/post/7038882314440409125

# 修改镜像配置文件(元数据)
docker save [镜像名] -o [导出文件名].tar
tar xf [导出文件名].tar -C [导出文件名]
vim [导出文件名]/manifest.json
tar cf [导出文件名].tar [导出文件名]
docker load -i [导出文件名].tar
# 图文参考https://blog.csdn.net/LCRxxoo/article/details/95678730



# 将宿主机文件拷贝至容器内
docker cp [本机文件地址] [容器名字]:[容器里的目标地址]
docker cp cptest.txt redis:test 
# 将容器内文件拷贝至宿主机
docker cp [容器名字]:[具体文件地址] [想要拷贝到本地的目标地址]
docker cp redis:/test/cptest.txt ./

# 发布镜像 发布镜像之前需要在docker官网创建仓库
# 登录仓库账号
docker login -u username
# 为仓库新建同名镜像+版本号(将会复制一个新的镜像出来)
docker tag REPOSITORY:version username/repositories
# 部署容器（测试）
docker run -dp port:port username/repositories --name imagename
# 发布镜像
docker push username/repositories

# 备份容器 -p 在提交过程中暂停容器
docker commit -p 58779d3f5a3f new_containername

# 恢复容器 --strip 1 洁牙师去掉前面1层目录，因为压缩时包含了绝对路径
docker run --rm --volumes-from mongo -v /backup:/backup ubuntu bash -c "cd /data/ && tar xvf /backup/backup.tar --strip 1"

# 搭建registry镜像仓库、本地镜像源
docker run -d -p 5000:5000 --restart always --name registry registry:2
# 将tag中镜像仓库地址修改掉
docker tag [image:version] [registry_url]/[image:version]
# 修改daemon.json
"insecure-registries": ["ip:port"]
# 推送镜像至私有仓库
docker push [registry_url]/[image:version]


# docker-compose
# 一次性启动多个容器（配合执行目录下docker-compose.yml使用）
# 通过docker-compose.yml启动的容器会自动创建通信网络，不需要额外配置
docker-compose up -d

# 如果更新了docker-compose.yml文件需要重建指定容器则使用如下命令，docker会自动删除并重建容器，但无法重复创建
docker-compose up -d [容器名]

# 一次性停止并删除多个容器 --volumes 删除主机数据卷
docker-compose down
docker-compose down --volumes

# 查看当前配置下容器启动情况
docker-compose ps

# 启动/停止/重启多个容器
docker-compose start/stop/restart

# 启动/停止/重启指定容器
docker-compose start/stop/restart [yml内容器名，不是实际容器名]
docker-compose start/stop/restart redis

# 查看日志
docker-compose logs

# 进入容器
docker-compose exec redis sh
docker-compose exec redis /bin/bash



# 拓展阅读
# bind mount
# 如果host机器上的目录不存在，docker会自动创建该目录
# 如果container中的目录不存在，docker会自动创建该目录
# host机器目录无论有没文件，都会覆盖container挂载目录
# volume
# 如果volume是空的而container中的目录有内容，那么docker会将container目录中的内容拷贝到volume中，但是如果volume中已经有内容，则会将container中的目录覆盖。
# 在Dockerfile中，我们也可以使用VOLUME指令来申明contaienr中的某个目录需要映射到某个volume：
# #Dockerfile
# VOLUME /foo
# 这表示，在docker运行时，docker会创建一个匿名的volume，并将此volume绑定到container的/foo目录中，如果container的/foo目录下已经有内容，则会将内容拷贝的volume中。也即，Dockerfile中的 VOLUME /foo 与 docker run -v /foo alpine 的效果一样。
# Dockerfile中的VOLUME使每次运行一个新的container时，都会为其自动创建一个匿名的volume，如果需要在不同container之间共享数据，那么我们依然需要通过 docker run -it -v my-volume:/foo 的方式将/foo中数据存放于指定的my-volume中。
# 因此，VOLUME /foo在某些时候会产生歧义，如果不了解的话将导致问题。
# 来源：http://t.zoukankan.com/zhangxiaoxia-p-13130409.html

# -a stdin: 指定标准输入输出内容类型，可选 STDIN/STDOUT/STDERR 三项； 
# -d: 后台运行容器，并返回容器ID； 
# -i: 以交互模式运行容器，通常与 -t 同时使用； 
# -t: 为容器重新分配一个伪输入终端，通常与 -i 同时使用； 
# –name=”nginx-lb”: 为容器指定一个名称； 
# –dns 8.8.8.8: 指定容器使用的DNS服务器，默认和宿主一致； 
# –dns-search example.com: 指定容器DNS搜索域名，默认和宿主一致； 
# -h “mars”: 指定容器的hostname； 
# -e username=”ritchie”: 设置环境变量； 
# –env-file=[]: 从指定文件读入环境变量； 
# –cpuset=”0-2” or –cpuset=”0,1,2”: 绑定容器到指定CPU运行； 
# -m :设置容器使用内存最大值； 
# –net=”bridge”: 指定容器的网络连接类型，支持 bridge/host/none/Container: 四种类型； 
# –link=[]: 添加链接到另一个容器； 
# –expose=[]: 开放一个端口或一组端口；
# 转自https://blog.csdn.net/HH2030/article/details/80994237


# rw、ro 和 不指定 的 区别
# 不指定（默认）
# 文件：
# 宿主机 修改该文件后容器里面看不到变化
# 容器 里面修改该文件，宿主机也看不到变化
# 文件夹：不管是宿主机还是容器内 修改、新增、删除文件 都会相互同步
# ro
# 文件：容器内不能修改，会提示read-only
# 文件夹：容器内不能修改、新增、删除文件夹中的文件，会提示read-only
# rw
# 文件：不管是宿主机还是容器内修改，都会相互同步；但容器内不允许删除，会提示Device or resource busy；宿主机删除文件，容器内的不会被同步
# 文件夹：不管是宿主机还是容器内修改、新增、删除文件，都会相互同步
# 来源：https://blog.csdn.net/wang_jing_jing/article/details/122437083

