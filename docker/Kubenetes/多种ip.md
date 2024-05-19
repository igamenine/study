一、IP

1. NODE IP

也称为INTERNAL-IP
这是各Node的物理网卡（也可能是VPS的虚拟网卡）的IP地址的映射地址（Host IP的映射IP），是ECS的私有IP地址，也可以称为Node IP 这部分信息可以通过kubectl get node -o wide获取得到。

2. POD IP

它是pod网络的IP地址，是每个POD分配的虚拟IP,可以使用 kubectl get pod -o wide来查看。

3. CLUSTER-IP

它是Service的地址,是一个虚拟地址（无法ping），是使用kubectl create时，--port 所指定的端口绑定的IP,各Service中的pod都可以使用CLUSTER-IP:port的方式相互访问（当然更应该使用ServiceName:port的方式）
可以使用‘kubectl get svc’进行查看。

2. EXTERNAL-IP

这是对外暴露出的地址，它在Node和Service的配置选项中都有。
在Node中的EXTERNAL-IP，实际是IaaS平台分配的公网IP
在Service中，如果使用type=NodePort的模式，它将直接使用Node的INTERNAL-IP，进而由IaaS转化成为公网地址，而在type=LoadBalancer的情况下，是由IaaS服务商再进行分配公网地址（阿里没有此项功能，所以效果等同于NodePort模式）。
使用kubectl get node -o wide和kubectl get svc -o wide命令都可以查看到。

二、PORT

1. targetPort

它是Pod内部容器的端口，比如tomcat是8080，PODIP:targetPort，构成了EndPoint

2. port

它是Service的虚拟端口，对targetPort进行映射。CLUSTER-IP:port，构成了微服务地址。

3. nodePort

它是集群对外暴露的端口，NODEIP:nodePort，构成对外访问的地址。

作者：JohnYuCN
链接：https://www.jianshu.com/p/7e3646e26fc7
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。