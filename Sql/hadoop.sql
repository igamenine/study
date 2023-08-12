-- Hadoop是分布式系统基础架构，解决数据存储和分析计算问题，广义上说，Hadoop通常指一个更广泛的概念——Hadoop生态圈
-- Hadoop三大发行版本：Apache（基础版本，开源）、Cloudra（继承了框架，收费，产品CDH）、Hortonworks（文档较好，产品HDP，公司使用）
-- Hadoop三大组件：HDFS（分布式文件存储系统,rom）、MAPREDUCE（计算框架）、YARN（服务管理框架，cpu、ram）
-- Hadoop四大优势：高可靠性、高扩展性、高效性、高容错性
-- HBASE是Hadoop生态中的NoSql数据库，采用key/value点对点存储，查询速度恒定，但不支持关联等复杂sql查询
-- hive是类sql结构化数据库、关系型数据库，和hbase共用hdfs，但不共享表，有索引，和hbase的区别是hbase仅提供点对点查询，hive提供结构化数据加工分析。

-- HDFS组件：
-- MAPREDUCE组件：
-- YARN组件：
-- HBASE：有列和列族，通过列族将列竖向切分，通过Region将行横向切分（按Region分布数据文件），列多称宽表，行多称高表。行有RowKey，类似于mysql的自增主键，数据删改不会立即删除数据而是新增数据，有定时清理机制。HBASE没有索引。存储MAPREDUCE清洗后的结果。

服务停止顺序：
1、HBASE
2、YARN
3、HDFS
4、Zookeeper
其他服务顺序随机，启动顺序反过来


就是说HBASE数据删改不会删除数据只会新增，那么type会改变吗？

HBASE有索引的概念吗？


Hbase是非关系型数据库，Hive是关系型数据库。
数据表不共享。