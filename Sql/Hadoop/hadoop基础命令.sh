# 启动集群
# 1、配置集群机器hostname(2.x是slaves)
vim etc/hadoop/workers
# 2、将你的集群机器都填写进去（注：文件中添加的内容结尾不允许有空格，文件中不允许有空行）
hadoop102
hadoop103
hadoop104
# 3、如果初次启动，则执行以下命令初始化，它会格式化Name Node并重新生成data目录结构，所以不是初次启动请不要执行（去namenode机器执行，配置项在core-site.xml）
hdfs namenode -format
# 4、启动HDFS，第一次执行会在集群其他机器自动创建data目录（集群hostname上面已经在workers配置过了）
sbin/start-dfs.sh
# 5、启动Yarn（去Resource Manager机器启动，配置项在yarn-site.xml），可以访问默认的8088网页调度网站。
sbin/start-yarn.sh



# 常用命令

# 初始化namenode，它会生成data和logs目录，data里有dfs/name/current目录、基础文件
hdfs namenode -format
# 启动hadoop集群(注意前往不同的机器执行脚本)
# 启动顺序：hdfs>yarn>historyserver
# 按照配置文件先后启动namenode、datanode、secondarynamenode，启动后会在dfs里生成data/current目录、基础文件
start-dfs.sh
# 启动resourcemanager、nodemanager
start-yarn.sh
# 关闭hadoop集群(注意前往不同的机器执行脚本)
# 关闭顺序：historyserver>yarn>hdfs
stop-yarn.sh
stop-dfs.sh
# 单独启动HDFS组件(单节点)
hdfs --daemon start/stop namenode/datanode/SecondaryNameNode
# 单独启动Yarn组件(单节点)
yarn --daemon start/stop resourcemanager/nodemanager
# 启动/停止JobHistoryServer服务（历史服务器），需要提前配置mapred-site.xml
mapred --daemon start/stop historyserver
# 创建单级目录
hadoop fs -mkdir /wcinput
# 创建多级目录（本机）
hadoop fs -mkdir /a/b/c
# 上传文件至目录（本机）
hadoop fs -put jdk.tar.gz /a/b/c
# 利用mapreduce对文本计数
hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-3.1.3.jar wordcount /input /output
# 查看进程是否启动
jps

# 剪切至HDFS
hadoop fs -moveFromLocal test.txt /
# 上传至HDFS
hadoop fs -copyFromLocal/-put test.txt /
# 下载至本地
hadoop fs -copyToLocal/-get /test.txt ./
# 添加内容至HDFS文件
hadoop fs -appendToFile test2.txt /test.txt
# 查看目录
hadoop fs -ls /
# 打开文件
hadoop fs -cat tes.txt
# 查看文件或目录大小
hadoop fs -du -s -h /test
# 查看目录下各文件大小
hadoop fs -du -h /text
# 设置副本数量
# 例子是设置10个副本，副本数量受限于DataNode节点的数量，1个节点存1个副本，将节点数增加到10是才会自动达到10个副本。
# 如果副本数从多到少，那么副本会从生成顺序从先到后逐步删除直到保留指定副本数
hadoop fs -setrep 10 /text.txt
# 其他和linux语法一样的命令
-chgrp(改变所属组) -chmod -chown -mkdir -cp -mv -tail(显示文件尾1k的内容) -rm
# 查看mapreduce(application)进程清单(可以获取Application-Id和Container-Id)
yarn application -list
# 查看mapreduce(application)进程清单添加状态信息
yarn application -list -appStates
# 关闭mapreduce(application)进程
yarn application -kill [Application-Id]
# 查看mapreduce(application)日志
yarn logs -applicationId [Application-Id]
# 查看container日志
yarn logs -applicationId [Application-Id] -containerId [AM-Container-Id]
# 查看任务中尝试运行的子任务(可以获取ApplicationAttermpt-Id)
yarn applicationattempt -list [Application-Id]
# 查看尝试运行的子任务的状态
yarn applicationattempt -status [ApplicationAttermpt-Id]
# 查看尝试运行的子任务所在容器清单(容器需要在运行)(可以获取ContainerId)
yarn container -list [ApplicationAttermpt-Id]
# 查看container状态
yarn container -status [ContainerId]
# yarn查看节点状态
yarn node -list -all
# yarn更新配置
yarn rmadmin -refreshQueues
# yarn查看队列
yarn queue -status [QueueName]
# yarn查看application任务状态
yarn application -status [ApplicationId]

# namenode/datanode服务异常处理
# 停止服务
stop-yarn.sh
stop-dfs.sh
  # 【测试环境】可以执行以下命令，【生产环境】跳过。
  # 删除每个集群上的data和logs（会清空数据，不要在生产环境操作！！！）
  rm -rf data logs
# 初始化namenode
hdfs namenode -format
  # 【生产环境】修改datanode的clusterid的方式，【测试环境】也可以用这个操作
  # 复制格式化后新生成的clusterID
  vim data/dfs/name/current/VERSION
  # 使用新的clusterID替换掉datanode记录的老ID
  vim data/dfs/data/current/VERSION
# 启动服务
start-dfs.sh
start-yran.sh
# 如果服务依旧没起来，需要检查以下防火墙设置。