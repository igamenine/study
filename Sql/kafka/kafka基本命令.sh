# 脚本都在bin目录下
# kafka的消费手段是主动拉（pull），因为被动推送的数据传输速率不满足消费者的上限
# kafka的组件分工：
# producer向cluster分发数据；
# cluster分类存储数据；
# consumer消费cluster存储的数据。
# cluster中的数据存储逻辑是按topic分主题（表）、按partitions分区。
# kafka可以存储视频、ppt等非结构化数据

# 查看kafka版本
# 正常来说目录名字会显示版本，生产环境会为了统一部署而重命名目录名称
ll kafka/libs
# 查看类似kafka_2.11-1.1.0.jar的文件，其中1.1.0就是kafka的版本

# kafka启动
kafka-server-start.sh -daemon config/server.properties
# kafka停止
kafka-server-stop.sh

# cluster使用kafka-topic.sh
# 连接cluster
# 创建topic
# 注：分区数、分区副本数只能增加不能减少
--bootstrap-server指的是
kafka-topic.sh --bootstrap-server hostname:port[,hostname:port,...] --topic [topic名称] --create --partitions [分区数] --replication-factor [分区副本数]
# 查询topic列表
kafka-topic.sh --bootstrap-server hostname:port[,hostname:port,...] --list
# 查看topic详细参数  
kafka-topic.sh --bootstrap-server hostname:port[,hostname:port,...] --topic [topic名称] --describe
# 修改主题——修改分区
kafka-topic.sh --bootstrap-server hostname:port[,hostname:port,...] --topic [topic名称] --alter --partitions [分区数]

# producer使用kafka-console-producer.sh
# 连接topic
kafka-console-producer.sh --bootstrap-server hostname:port[,hostname:port,...] --topic [topic名称]
# （连接后）生产数据，即直接输入字符串回车（存储外部数据比较复杂要开发）
[字符串]

# consumer使用kafka-console-consumer.sh
# 消费最新数据：只会消费进程运行后生产的数据
kafka-console-sonsumer.sh --bootstrap-server hostname:port[,hostname:port,...] --topic [topic名称]
# 消费历史数据：会同时消费topic的历史数据
kafka-console-sonsumer.sh --bootstrap-server hostname:port[,hostname:port,...] --topic [topic名称] --from-beginning

# 例子
/app/bigdata_client/Kafka/kafka/bin/kafka-console-consumer.sh --topic sxmac --bootstrap-server 41.220.44.108:21007,41.220.44.109:21007,41.220.44.110:21007 --consumer.config  /app/bigdata_client/kafka/kafka/config/consumer-1.properties --from-beginning | head

# 存储外部数据
# theory:Producer>send(ProduerRecord)[>Interceptors]>Serializer>Partitioner>>RecordAccumulator(storage:RAM,defalut:32MB){DQuene{{ProducerBatch(defalut:16k)}}}>>sender(defalut:batch.size=16k,linger.ms=0ms)>>kafka cluster{broker}(acks in(0,1,-1))

# 消费外部数据
# 消费者与消费者是独立的进程，互不影响，允许消费重复分区数据，但消费组中的消费者不允许消费重复分区数据
# 当消费者数量多于分区时，多余的消费者闲置挂机
# 多方消费者消费数据会受到辅助组件coordinator的限制，当coordinator检测到某个消费者无法连接时（默认3秒一次心跳，超过45秒），才会将任务重新分配给其他消费者。值得一提的是，每个消费者的offsets都存储在coordinator中，coordinator=groupid的hashcode值%50(__consumer_offsets的分区数量)