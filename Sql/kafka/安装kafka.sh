  1、规划集群，找个合适的地方放置安装
  2、下载安装包
  安装包下载地址：
  http://kafka.apache.org/downloads.html
  3、解压安装包
  tar zxvf kafka_2.12-3.0.0.tgz
  4、修改名称（可选）
  mv kafka_2.12-3.0.0 kafka
  5、修改配置
  vim kafka/config/server.properties
  6、更改基本配置项
  kafka唯一节点broker.id，数据存储目录log.dirs，zk地址zookeeper.connect。
  7、添加系统环境
  vim /etc/profile.d/my_env.sh # 环境脚本可自定义名称
  # KAFKA_HOME
  export KAFKA_HOME=/opt/module/kafka # 根据实际安装目录填写
  export PATH=$PATH:$KAFKA_HOME/bin
  :wq
  source /etc/profile
  8、启动zookeeper（如果关闭）
  zk.sh start
  9、启动kafka
  kafka-server-start.sh -daemon config/server.properties
