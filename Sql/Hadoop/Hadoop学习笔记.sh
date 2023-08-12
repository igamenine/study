# 注：Hive是有锁表机制的。
# Hadoop最基本的三大组件：HDFS、Yarn、MapReduce，这三个必须要有，其他都是辅助组件。通用配置文件(common)为etc/core-site.xml和wordkers
# Hadoop的运行模式有：
# 独立运行模式(本地运行模式)：数据存储在Linux本地，不需要启动组件服务，该模式主要用于开发调试MapReduce程序的应用逻辑。（应用场景：学习测试用）
# 伪分布模式：在一台单机上运行，但用不同的Java进程模仿分布式运行中的各类结点，该模式在单机模式之上增加了代码调试功能，允许你检查内存使用情况，HDFS输入输出，以及其他的守护进程交互。数据存储在HDFS（应用场景：小微企业项目，不需要多台机器）
# 完全分布模式：数据存储在HDFS，以及多台服务器工作（使用场景：主流环境，正经企业级项目都会用）
# hadoop调用jar包来实现计算需求（待验证）
# hadoop分为source版本和binary版本，区别时binary是打包的，我们平常使用后者

HDFS:
文件存储系统，由三个组成部分，分别是: [
    NameNode(nn):
    管理节点，存储数据文件属性、地址
    DataNode(dn):
    数据节点，存储数据块
    Secondary NameNode(2nn):
    备份节点，定期备份NameNode数据，分担某些工作如定期合并日志等
]
配置文件为etc/hdfs-site.xml
执行脚本为bin/hdfs
启动脚本为sbin/start-dfs.sh
停止脚本为sbin/stop-dfs.sh
NameNode和SecondaryNameNode不要安装在同意服务器，原因是备份节点和主节点在一台服务器上就没有备份容灾的意义了

Yarn:
资源管理器，主要管理CPU和内存的分配；
两个组成部分，分别是: [
    ResourceManager(RM):
    所有资源的管理者
    NodeManager(NM):
    单节点资源管理者，子进程有: [
        Container:
        单元计算任务容器，封装固定的任务资源，默认内存设置限制为1-8GB（用于估算NM能开启多少Container），子进程有: [
            ApplicationMaster(AM):
            单元任务运行管理者，用于向RM申请计算资源（如果资源超出所在NM上限，允许跨容器跨节点运行任务），申请成功后会在Container中生成MapTask运行任务，运行完毕会生成ReduceTask汇总数据。  
        ]
    ]
]
配置文件为etc/yarn-site.xml
执行脚本为bin/yarn
启动脚本为sbin/start-yarn.sh
停止脚本为sbin/stop-yarn.sh
ResourceManager不要和NameNode、SecondaryNameNode配置在同一台机器，原因是内存消耗过大

(MR):
数据计算进程，利用硬盘直接读写进行计算；
具体流程为HDFS(values)>Map>Map shuffle>[values_sort]>Reduce shuffle>[values_partition]>Reduce>HDFS(values_result)
两个组成部分，分别是: [
    Map(MapTask):
    分发计算任务至各节点。计算结果排序用Map shuffle。
    Reduce:
    对Map结果进行汇总。计算结果分区用Reduce shuffle。
]
配置文件为etc/mapred-site.xml
由于MapTask进程归NodeManager管理，所以修改配置后需要重启yarn
执行脚本为bin/mapred
常用的jar包在share/hadoop/mapreduce/
重组方式（如shuffle）归Yarn管，配置文件为etc/yarn-site.xml
MapReduce会在HDFS或Yarn需要的时候执行任务，不需要挂在后台
MapReduce不擅长小数据实时计算、动态数据流式计算、DAG有向无环计算

集群配置样例：
===========================================================
        hadoop102       hadoop103       hadoop104
HDFS    NameNode                        SecondaryNameNode
        DataNode        DataNode        DataNode

Yarn                    ResourceManager
        NodeManager     NodeManager     NodeManager
============================================================

hadoop Block Size 块文件默认大小128MB（1.x是64MB），块大小受硬盘传输速率决定，如果传输速率比较高可以设置的高一点，跟传输速率匹配可以提高读写性能，如果块文件过小（或和硬盘性能不匹配）会增加寻址时间，块文件过大会增加计算时间。

hadoop fs、hadoop dfs、hdfs dfs的区别
1、fs、dfs区别？

(1) fs是文件系统， dfs是分布式文件系统。
(2) fs > dfs。
(3) 分布式环境情况下，fs与dfs无区别。
(4) 本地环境中，fs就是本地文件，dfs就不能用了。
(5) fs涉及到一个通用的文件系统，可以指向任何的文件系统如local，HDFS等。但是dfs仅是针对HDFS的。

2.hadoop fs、hadoop dfs、hdfs dfs命令的区别？

hadoop fs：
通用的文件系统命令，针对任何系统，使用范围最广，对象：可任何对象：比如本地文件、HDFS文件、HFTP文件、S3文件系统等。
hadoop dfs（淘汰）：
特定针对HDFS的文件系统的相关操作，但是已经不用了。
hdfs dfs：
与hadoop dfs类似，同样是针对HDFS文件系统的操作，替代hadoop dfs。常用。

常用端口号说明
=========================================
端口名称        hadoop2.x       hadoop3.x
namenode        8020/9000       8020/9000/9820
namenodeweb     50070           9870
yarnweb       8088            8088
historyserver   19888           19888
=========================================

hdfs存储的文件只能追加信息不能修改信息；
hdfs优点：高容错、大数据、载体可廉价；
hdfs缺点：无法毫秒级存储及访问数据、无法高效存储及访问大量小文件、不支持并发写入与随机修改

windows远程连接HDFS除了配置bin目录环境变量以外还要打开一次winutils.exe

hdfs写数据是检查完客户端用户权限与目录有效性后同时往节点距离最近节点传输数据及在节点上建立通道传输至另一个节点，以此类推直到指定的节点都同步完毕
hdfs读数据是检查完客户端用户权限与目录有效性后根据节点距离最近原则对节点建立通道尝试下载数据，但如果系统判断该节点传输压力过大，那么读取下一个块文件时会交接给其他节点

节点距离最近：两点距离各自的上级等级相加，每隔一级算1，跟实际距离没关系，如【大楼-机房-机架（机柜）-节点】总共4有4级，节点无论位置，对上级机柜而言都是1级，所以相同机柜内的节点距离都为2（节点a距离机柜为1，节点b距离机柜为1，合计2）

流式计算：对更新频率高、更新时间越新价值越高的数据进行计算，MapReduce不擅长，一般使用Spark（Spark streaming）。
DAG有向无环计算：串行的计算方法，及讲计算任务a的结果作为计算任务b的参数，讲计算任务b的结果作为计算任务c的参数，以此类推，一般使用Spark。

如果要形容、类比的话，HDFS是文件系统，Yarn是操作系统，MapReduce是应用程序。

spark与hadoop的联系
Hadoop提供分布式数据存储功能HDFS，还提供了用于数据处理的MapReduce。 MapReduce是可以不依靠spark数据的处理的。当然spark也可以不依靠HDFS进行运作，它可以依靠其它的分布式文件系统。但是两者完全可以结合在一起，hadoop提供分布式 集群和分布式 文件系统，spark可以依附在hadoop的HDFS代替MapReduce弥补MapReduce计算能力不足的问题。


待解决的问题：
当客户端的需求是查找文件时，MapReduce是将查询结果拷贝一份到硬盘中还是返回结果文件路径位置？