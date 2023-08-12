#启动
[zookeeper安装路径]/bin/zkServer.sh start
#停止
[zookeeper安装路径]/bin/zkServer.sh stop
#查看状态
[zookeeper安装路径]/bin/zkServer.sh status
#启动本地客户端
[zookeeper安装路径]/bin/zkCli.sh
#启动指定客户端
[zookeeper安装路径]/bin/zkCli.sh -server 192.168.100.1:2181

#授权认证访问命令（如果开启）
addauth digest [用户名]:[密码]
#创建节点配置项 可带参数，配置项名称不可重复
create /node1 "node1"
#创建带序号节点配置项 可带参数，会在配置项名称后自动生成自增10位序列号（独立自增序号，不跟配置项绑定）
create -s /node1 "node1"
#创建临时节点配置项，客户端退出后会消失
create -e /node1 "node1"
#删除节点
delete /node1
#递归删除节点
rmr /node1
#设置/修改节点
set node1 "node1"
#监听节点配置项
get /node1
#监听节点配置参数
get -s /node1
#查看节点配置项
ls
#查看节点配置参数
ls -s
#退出
quit
