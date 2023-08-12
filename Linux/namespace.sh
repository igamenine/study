namespace即命名空间，其作用是隔离、区分不同应用之间的同名变量，使他们在相同运行环境下免于产生同名冲突。
从Linux的namespace中可以看出，namespace可以当作是应用的主键ID用来标识身份；
目前Linux提供了六类系统资源的隔离机制，分别是：
Mount: 隔离文件系统挂载点
UTS: 隔离主机名和域名信息
IPC: 隔离进程间通信
PID: 隔离进程的ID
Network: 隔离网络资源
User: 隔离用户和用户组的ID
更多参见https://zhuanlan.zhihu.com/p/73248894