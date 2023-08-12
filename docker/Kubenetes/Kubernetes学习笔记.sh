# Kubernetes(k8s)——希腊语，意为舵手/飞行员
# Kubernetes是Google开源的一个容器编排引擎，它支持自动化部署、大规模可伸缩、应用容器化管理。在生产环境中部署一个应用程序时，通常要部署该应用的多个实例以便对应用请求进行负载均衡。在Kubernetes中，我们可以创建多个容器，每个容器里面运行一个应用实例，然后通过内置的负载均衡策略，实现对这一组应用实例的管理、发现、访问，而这些细节都不需要运维人员去进行复杂的手工配置和处理。
# Kubernetes核心组件分别是Pod、Controller、Service。
# Kubernetes和docker的不同简单概述：docker通常应用于单机模式部署，kubernetes应用于多台机器的集群模式部署，kubernetes更利于应用扩展，但是要注意Kubernetes是基于docker做的集群框架，底层依旧是docker。
# 提到Kubernetes，不得不提的就是【云原生】这个概念，因为Kubernetes是云原生(CNCF)托管的第一个项目，所以提到云原生，我们都会将它于Kubernetes联系起来，所以某种意义上说，部署在Kubernetes上的应用都可以称之为云原生应用。
# kubernetes从1.24开始不再支持docker，container-runtime默认为containerd。以前的版本是通过docker shim组件支持的，需求从kubernetes要先到docker转发到containerd效率低而且功能重复冗余，详情请阅读docker目录下Containerd。

pod和容器的区别唯一答案！
【重要！！！】
以下内容根据测试破案了，仅记录如下。pod是逻辑主机，仅仅是资源分类，和其他资源分类一样，只是为了方便管理而存在，它仅仅是将容器进行分组，没有整合到一起的意思，虽然pod内容器网络互通、共享资源，但所谓的进入pod实际上就是进入pod内的第一个容器，当pod只有一个容器时，我们以为我们进入了pod，实际上就是进入了容器，如果进入多个容器的pod，kubernetes会提示用户还未指定容器，使用-c指定容器即可进入不同的容器。

---

# kubernetes主要功能：
# 1、自动装箱
基于容器对应用运行环境的资源配置要求自动部署应用容器，你告诉Kubernetes每个容器需要多少CPU和内存，Kubernetes可以将这些容器按实际情况调度到你的节点上，以最佳方式利用你的资源。
# 2、自我修复
当容器启动失败/替换容器/杀死不响应用户定义的运行状况检查的容器时，会对容器自动重启，当所部署的Node节点有问题时，会对容器进行重新部署和重新调度，当容器未通过监控检查时，会等待此容器直到容器正常运行时，才会声明此容器对外提供服务。
# 3、水平扩展
通过简单的命令、用户UI界面或基于CPU等资源使用情况，对应用容器进行规模扩大或规模剪裁。
# 4、服务发现
用户不需要使用额外的服务发现机制，就能够基于Kubernetes自身能力实现服务发现和负载均衡，使用统一的服务监控入口（Service）。
# 5、滚动更新
可以根据应用的变化，对应用容器运行的应用，进行一次性或批量式更新。
# 6、版本回退
可以根据应用部署情况，对应用容器运行的应用，进行历史版本实时回退。
# 7、密钥和配置管理
在不需要重新构建镜像的情况下，可以部署和更新密钥和应用配置，也无需在堆栈配置中暴露密钥，类似热部署。
# 8、存储编排
自动实现存储系统挂载及应用，特别对有状态应用实现数据持久化非常重要，存储系统可以来自本地目录、网络存储、公共云存储服务。
# 9、批处理
提供一次性服务、定时服务，满足批量数据处理和分析的场景。

MasterNode(Master):
主控管理节点，新称控制平面(control plane/CP)，
有4个子组件，分别是: [
  API server:
  集群统一入口，处理内外部请求，请求以restful方式交给etcd存储，Secure Port为6443(https)，insecure Port为8080(http)，端口给Node连接时会用到。
  controller-manager:
  处理集群中常规后台任务，一个资源（应用）对应一个控制器，装载kubernetes核心组件Controller: [
  Controller:
  确保预期Pod副本数量，可无状态应用部署、有状态应用部署，确保所有node运行同一个Pod，分配一次性任务和定时任务，控制器包含以下4类: [
    Node Controller(NC):
    节点控制器，负责在节点出现故障时进行通知和响应；
    Job Controller(JC):
    任务控制器，监测代表一次性任务的Job对象，然后创建Pods来运行这些任务直至完成；
    Endpoints Controller(EC):
    端点控制器，填充端点(Endpoints)对象（Service与Pod的入口）；
    Service Account & Token Controllers(SATC):
    服务帐户和令牌控制器，为新的namespace(ns)创建默认帐户和API访问令牌
    ]
  ]
  scheduler:
  节点调度器，选择node节点应用部署调度，scheduler会考虑容器集的资源需求以及集群的运行状况，将其安排到适当的计算节点。
  etcd:
  键值对数据库(NoSql)，存储配置数据和集群状态信息。
]
有一个可选组件cloud-controller-manager(云控制管理器)，允许你将你的集群连接到云提供商的API之上，并将与该云平台交互的组件同与你的集群交互的组件分离开来，如果在自己的环境中运行Kubernetes，或者在本地计算机中运行学习环境，所部署的集群不需要有云控制器管理器


WorkerNode(Node):
工作节点，会在每个节点上运行，负责维护运行的Pod并提供Kubernetes运行环境，
有3个子组件，分别是: [
  kubelet:
  WorkerNode的master主控管理服务，保证containers都运行在pod中，当控master需要在节点中执行某个操作时，Kubelet就会执行该操作。
  kube-proxy:
  网络代理服务，负责负载均衡实现，是Kubernetes核心组件Service的一部分。kube-proxy维护节点网络规则和转发流量，实现从集群内部或外部的网络与pod进行网络通信。
  container runtime/docker:
  容器运行时，负责运行容器的软件，kubernetes支持许多容器运行环境，例如containerd、docker(dockershim)或者其他实现了CRI(容器运行时接口)的容器。简单来说就是容器底层组件，装载Kubernetes核心组件Pod: [
    Pod:
    kubernetes最小部署单元，是容器的集合，Pod中的容器共享网络，不过它的生命周期是短暂的。
    同一个pod中的容器总是会被自动安排到集群中的同一节点上，并且一起调度。
    pod可以理解为运行特定应用的“逻辑主机”，这些容器共享存储、网络和配置声明（如资源限制）。
    每个pod有唯一的IP地址，IP地址分配给pod，在同一个pod内，所有容器共享一个IP地址和端口空间，pod内的容器可以使用localhost互相通信。
    pod中会有一个pause容器，该容器负责代表整个pod的状态，以及共享pause容器的ip地址和存储，这样就做到了文件共享和互信。
  ]
]

注：docker在kubernetes中使以dockershim组件兼容的形式充当其容器引擎的，v1.24版本起kubernetes移除了dockershim，不再支持docker作为容器引擎。

---

# Service
可以简单理解为网络服务，Service将运行在以组pods上的应用程序公开为网络服务的抽象方法。Service为一组pod提供相同的DNS名，并且在他们之间进行负载均衡。Kubernetes为pod提供分配了IP地址，但IP地址可能会发生变化，集群内的容器可以通过service名称访问服务，而不需要担心pod的IP发生变化。
逻辑上的一组可以互相替换的pod，通常称为微服务，service对应的pod集合通常是通过选择符来确定的，举个例子，在一个service中运行了3个nginx的副本。这些副本是可互换的，我们不需要关心它们调用了哪个nginx，也不需要关注pod的运行状态，只需要调用这个服务就可以了。

# Kind
对象类别，例如Pod、Deployment、Service、ReplicaSet、StatefulSet等。

# metadata
描述对象的元数据，包括name字符串、UID和可选的namespace

# spec
对象的配置

# ReplicaSet
无状态副本集是一个pod的集合。它可以设置运行pod的数量，确保任何时间都有指定数量的pod副本在运行，通常我们不直接使用ReplicaSet，而是在Deployment中声明。
# Deployment
部署Deployment是对ReplicaSet和pod更高级的抽象，它使pod拥有多副本、自愈、扩缩容、滚动升级等能力。
# StatefulSet
有状态副本集的特性跟ReplicaSet和Deployment相反，它是强调状态的副本集，和后者是无状态副本集，区别简单来说就是会严格规范包括IP、hostname在内的初始化配置，并严格执行启动顺序。该副本集特性于v1.5之后加入。Pod重新调度后其PodName和HostName不变，基于Headless Service（即没有Cluster IP的Service）来实现。相关命令和deployment的一样（都能部署扩缩pod），只是实现原理不一样。
StatefulSet一般用于管理数据库、缓存。即statefulset是和headlessservice绑定在一起用的。
# Headless Service
无头服务可以为statefulset成员提供稳定的DNS地址（在容器中的hosts文件展现），在不需要负载均衡的情况下，可以通过指定ClusterIP的值=None来创建Headless Service；比如，如果用pod创建数据库服务，通过service放开访问，那么因为负载均衡的关系每次请求都会转发给不同的数据库，这样子使用过程中会有很大的问题。注：service中的metadata.name要跟statefulset中的service.name一致。
即虽然使用statefulset创建了有状态副本集，还是要借助service转发请求。
headless service在service的type里分类依然为ClusterIP，但是其IP是None。
dns地址格式=[ip]  [pod].[service].[namespace].svc.cluster.local [pod]
# 例10.42.0.130 mysql-sts-0,mysql-svc.default.svc.cluster.local mysql-sts-0

# Ingress
初学者可以当作nginx使用，Ingress对象解决互联网通过域名访问kubenetes应用服务时统一转发多个service的问题。Ingress可以实现url路由规则配置，负载均衡、流量分隔、流量限制、HTTPS配置、基于名字的虚拟托管。
想使用Ingress需部署Ingress控制器，例如常见的Ingress-Nginx，不同控制器用法和配置是不一样的。
注意：Ingress只能公开HTTP和HPTTS类型的服务到互联网，公开其他类型服务，需要使用NodePort或LoadBalancer类型的Service。
k3s自带一个基于Traefik的Ingress控制器，因此我们可以直接创建Ingress资源。

# namespace(ns)
命名空间是一种资源隔离机制，将同一集群中的资源划分为相互隔离的组。命名空间可以在多个用户之间划分集群资源（通过资源配额），例如可以设置【开发、测试、生产】等多个命名空间。同一命名空间内的资源名称要唯一，但跨命名空间时没有这个要求。
命名空间作用域仅针对带有名字空间的对象，如deployment、service等，这种作用域对集群访问的对象不适用，例如storageclass、node、persistentvolume，言下之意就是只作用于配置项，不作用与实体。
namespace有4个初始空间：
1、default
默认命名空间，不可删除，未指定明明空间的对象都会被分配到default。
2、kube-system
kubernetes系统对象（master/cp和node组件）所使用的命名空间。
3、kube-public
自动创建的公共命名空间，所有用户（包括未经过身份验证的用户）都可以读取它。通常我们约定，将整个集群中公用的可见和刻度的资源都放在这个空间中。
4、kube-node-lease
租约对象使用的命名空间，每个节点都有一个关联的lease对象，lease是一种轻量级资源。lease对象通过发送心跳，监测集群中的每个节点是否发生故障。

# ServiceType --type参数
# ClusterIP
将服务公开在集群内布。kubernetes会给服务分配一个集群内部的IP，集群内的所有主机都可以通过这个Cluster-IP访问服务。集群内部的pod可以通过service名称访问服务。
# NodePort
通过每个节点的主机IP和静态端口（NodePort）暴露服务。集群的外部主机可以使用节点IP和NodePort访问服务。PORT(S)映射关系为：pod的供集群访问的外部端口（port）:宿主机端口（nodePort，如果没有指定kubenetes随机生成），具体指定方式是配置yaml文件，具体参见https://support.huaweicloud.com/usermanual-cce/cce_10_0142.html
# ExternalName
将集群外部的网络引入集群内部。
# LoadBalancer
使用云提供商的负载均衡器向外部暴露服务。

---

# 管理对象
# 命令行指令
例如，使用kubectl命令来创建和管理kubernetes对象。
它功能有限，不适合复杂场景，操作不容易追溯，多用于开发和调试。
# 声明式配置
kubernetes使用yaml文件来描述kubernetes对象。声明式配置就好比申请表，学习难度大且配置麻烦。好处是操作留痕，适合操作复杂的对象，多用于生产。

# YAML
1、缩进代表上下级关系
2、原则上缩进时不允许使用Tab键，只允许使用空格，通常缩进2个空格（除非你将Tab设置成缩进2个空格）
3、:键值时，后面必须有空格
4、-列表，后面必须有空格
5、[ ]数组
6、#注释
7、|多行文本块
8、---表示文档的开始，多用于分割多个资源对象
9、默认需要配置apiVersion、kind、metadata、spec

# Labels
标签时附加到对象上的键值对，用于补充描述信息。标签使用户能够以松散的方式管理对象映射，而无需客户端存储这些映射。由于一个集群中可能管理成千上万个容器，我们可以使用标签高效的进行选择和操作容器集合。
键的格式：
前缀（可选）/名称（必选）
有效名称和值：
最多63个字符，可以为空，必须以字母或数字开头和结尾
特殊符号仅可使用破折号-、下划线_、点.



# 挂载卷 kubernetes使用在yaml中配置mountPath和hostPath的方式代替volume挂载卷，与docker不同的是可以配置挂载路径的类型type
# kubernetes中的卷(volume)
# 注意，其中提到的例子都是卷的类型不是对象，删除pod并不会删除临时卷的configMap和secret对象，但临时卷的类型会被同时删除。
临时卷：与pod一起创建和删除，生命周期与pod相同，如缓存/存储日志emptyDir、注入配置configMap、secret、downwardAPI，临时卷位于pod所在节点的/var/lib/kubelet/pods目录下；

持久卷：删除pod后，持久卷不被删除，如本地存储hostPath、local、网络存储NFS、分布式存储Ceph（cephfs文件存储、rbd块存储），可以理解为虚拟硬盘，属于公共资源，不属于某个ns；
创建local类型的持久卷，必须创建storageClass和设置nodeAffinity，调度器使用nodeAffinity信息来将使用local卷的pod调度到持久卷所在的节点上，不会出现pod被调度到别的节点上的情况；
一般pod并不是直接使用持久卷，而是使用持久卷声明(persistentVolumeClaim/PVC)当作存储卷来使用，对pod而言PVC就是持久卷；PVC可以请求指定容量的存储空间和访问模式，PVC对象是带有ns的，用户申请持久卷时无需提供持久卷详细信息，仅需提供资源信息集群会自动匹配符合需求的持久卷给它；

投射卷：projected卷可以将多个卷映射到同一个目录上。
# mountPath
容器挂载卷
# hostPath
宿主机挂载卷，仅供单节点测试使用，多节点集群请用local卷
# local
宿主机挂载卷，供多节点集群使用，但是不支持动态创建卷，必须手动创建持久卷。当搭载持久卷的节点的存储出现故障或者整个节点不可用时，pod和卷都会失效，仍然会丢失数据。local的path配置再持久卷(PV)中，持久卷声明(PVC)不在定义path。
# ConfigMap
为了应对特殊容器（数据库）被集群分发调度产生数据不一致的问题，kubernetes使用了ConfigMap对象，它用来在etcd中保存非加密数据，可以用作环境变量、命令行参数或者存储卷，将环境配置信息与容器镜像解耦，便于配置的修改。不过ConfigMap在设计上不是用来保存大量数据的，在ConfigMap中保存的数据不可超过1MiB，超出此限制，需要考虑挂载存储卷或者访问文件存储服务。简单来说就是类似Apollo，将配置文件托管在etcd中维护。
当pod运行时，会生成同名的特殊类型的卷，引用此configMap对象，该特殊卷会随着临时卷的删除而删除。
# emptyDir
初始内容为空的本地临时目录
# Secret
Secret用于保存机密数据的对象，一般用于保存密码、令牌或密钥等。
data字段用来存储base64编码数据，stringData字段存储未编码的字符串。
Secret意味着你不需要在应用程序代码中包含机密数据，减少机密数据泄露的风险。Secret可以用作环境变量、命令行参数或者存储卷文件。
当pod运行时，会生成同名的特殊类型的卷，引用Secret对象，该特殊卷会随着临时卷的删除而删除。
# Selector
标签选择器可以识别一组对象。标签不支持唯一性。标签选择器最常见的用法是为Service选择一组Pod作为后端。目前支持两种类型的选择运算：
基于等值(key: value);
基于集合({key: value, operator: In, values: [val1, val2...]}),
多个选择条件使用逗号分隔，相当于and（&&）运算。
# 具体base64数据可使用echo [values]|base64生成
# StorageClass
存储类，用来在PVC中声明用以动态创建卷（即如果不声明StorageClass则会匹配现有静态卷，如果不指定StorageClass则使用默认class），一个集群可以存在多个存储类来创建和管理不同类型的存储，每个StorageClass都有一个制备器(Provisioner)用来决定使用哪个卷插件制备PV，该字段必须指定。
【重要】只要指定了存储类，PVC哪怕没有响应的PV或没有符合条件的PV，存储类也会自动创建PV（当卷绑定模式为Immediate时），不过当PVC被删除时，绑定的PV也会被删除。
一般使用静态创建和动态创建结合的方式，管理员事先手动创建一些常用规格的持久卷以备使用，集群也可以根据用户请求动态的创建持久卷。
# nodeAffinity
节点亲和性，它通过nodeSelector将pod和存储调度到指定的节点上，从而避免了pod和存储不在同一个节点的情况。
# VolumeBindingMode
卷绑定模式，用于控制什么时候动态创建卷和绑定卷，分别是Immediate/立即创建模式和WaitForFirstConsumer/牙齿创建模式，Immediate模式下会在创建PVC后同步创建PV并完成绑定，WaitForFirstConsumer模式当该PVC的pod被创建时才会自动创建PV并完成绑定（默认模式）。
# Reclaim Policy
回收策略，它会告诉集群，当用户删除PVC对象时，从PVC中释放出来的PV将被如何处理，由删除(delete)和保留(Retain)两种策略，当被设置成保留时，需要手动删除PV，否则保留PV及其数据，且不能用于其他PVC。


# PV和PVC的补充说明
1、创建PVC后，集群会查找满足要求的PV，将PVC绑定到该PV上；
2、PV和PVC是一对一关系，当pv被绑定后不再服务于其他PVC，具有排他性，比如即使PV有10gb存储，绑定的PVC声明只要1gb，也会将整个pv占据；
3、PVC可能会匹配到比声明容量大的持久卷，但不会匹配比声明容量小的持久卷，以及只会匹配一个对象，不会出现一个PVC绑定了多个PV的情况，所以那种100GB需求分给2个50G的PV的现象不存在；
4、找不到满足要求的PV，PVC会无限期地处于未绑定状态(Pending)，直到出现了满足要求的PV时，PVC才会绑定；
5、PV的状态有四种，分别时可用(Available)/已绑定(Bound)/已释放(Released)/失败(Failed)；
6、删除pod不会删除绑定的PVC和PV，需要用户手动删除PVC和PV，否则PV会释放失败，注意删除pod之前先删除PVC，再删除PV，最后删除pod，除非你准备重启pod；
7、PVC需要配置访问模式(accessModes)，有以下模式：
  # ReadWriteOnce
  被单个节点以以读写方式挂载，允许同一节点的多个pod访问。
  # ReadOnlyMany
  被多个节点以只读方式挂载。
  # ReadWriteMany
  被多个节点以读写方式挂载。
  # ReadWriteOncePod
  被单个节点以读写方式挂载，集群中只有一个pod可以读写该卷；该模式支支持CSI卷，kubernetes版本为1.22及以上。
8、卷模式(volumeMode)是一个可选参数，支持两种，分别是文件系统(Filesystem)和块文件(Block)，默认是Block；




---

# 常用命令缩写
name              abbreviation  Kind
namespace         ns            Namespace
nodes             no            Node
pods              po            Pod
services          svc           Service
deployments       deploy        Deployment
replicasets       rs            ReplicaSet
statefulsets      sts           StatefulSet
configmap         cm            ConfigMap
ephemeral volume  ev            Ephemeral volume
persistent volume pv            Persistent Volume


# 大佬推荐的https://www.bilibili.com/video/BV1k24y197KC 教程太强了，全是干货没有一句废话，作为零基础的我看的一愣一愣的需要恶补基础知识：
通过学习Kubernetes的过程中我接触到了container runtime（容器运行时）的概念，发现容器并不只是docker的代称，它还涉及到containerd，这让我感到惊讶，原来containerd不只是docker的组件，它也能代替docker。在容器运行时的科普中提到了CoreOS，它原生支持docker并更适合用来搭载容器，因为它的设计理念就是操作系统和应用程序彻底分开治理。容器运行时简单来说其实指的就是容器整个寿命周期的管理系统。如果要对容器运行时有真正具体的认识，我发现我需要重新了解何为容器，因为有coreOS的存在，我发现我甚至不清楚容器本身搭载的底层系统到底是什么……

# k3s
k3s是一个轻量级的、完全兼容Kubernetes的k8s发行版本（不是什么阉割版），非常适合初学者。k3s将所有kubernetes控制平面组件都封装在单个的二进制文件和进程中，文件大小<100M，占用资源更小，且包含了kuberntes运行所需要的部分外部依赖和本地存储提供程序。k3s特别适用于边缘计算、物联网、嵌入式和ARM移动端场景。

# 关于如何在kubernetes中以非root用户运行组件，参见https://kubernetes.io/zh-cn/docs/tasks/administer-cluster/kubelet-in-userns/

# 容器运行时接口(CRI)
容器运行时接口的补充：容器运行时有一个crictl命令，用法和docker命令一样，可以用来检查和调试底层的运行时容器，在不支持docker的v1.24版本会经常用到。

# 金丝雀部署（灰度发布）
名字含义来源于早期矿工利用金丝雀测试矿里是否有毒气，现在作为部署方式的一种代称。
在集群中先选择一个节点部署新版本yaml测试，如果新版本没有问题则将集群节点服务进行逐步升级。这是kubernetes的默认发布、更新方式，更新、添加的pod经检验无误后可手动上线新pod、下线老pod，替换掉集群的老pod。
kubernetes的实现方式有一定缺陷，那就是不能根据用户注册时间、地区等请求中的内容属性进行流量分配，用户多次访问有概率同时访问到新旧版本pod，造成这些问题的原因时kubernetes只在TCP层面解决负载均衡问题，并不对请求响应的消息内容做任何解析和识别。
如果想要更完善地实现金丝雀发布，可以考虑lstio灰度发布，参见https://www.infoq.cn/article/lei4vsfpiw5a6en-aso4/

---

pod和容器的区别唯一答案！
【重要！！！】
以下内容根据测试破案了，仅记录如下。pod是逻辑主机，仅仅是资源分类，和其他资源分类一样，只是为了方便管理而存在，它仅仅是将容器进行分组，没有整合到一起的意思，虽然pod内容器网络互通、共享资源，但所谓的进入pod实际上就是进入pod内的第一个容器，当pod只有一个容器时，我们以为我们进入了pod，实际上就是进入了容器，如果进入多个容器的pod，kubernetes会提示用户还未指定容器，使用-c指定容器即可进入不同的容器。
# 学习kubernetes中我产生了一个疑问，
# pod是Kubernetes最小单位，pod又是容器的集合，那么容器会单独划分一块地方作为自己的“领地”，可pod中又同时存在多个容器，理论上pod和容器的关系应该是分层，即我进入了pod，想操作不同的容器进程还需要在pod中进入容器，事实上我测试了一下不需要，比如在pod中可以直接ps aux查看所属容器的进程。
# 我测试用的pod只有1个容器，但当存在多个容器时，是否会查出所有容器的不同进程？容器中的PID理论上是单独计算的，那么多个不同的容器产生的PID一定会产生重复现象。关于这点老师没有提到，我手头上没有复杂的pod可以给我测试，我稍后去翻阅官方文档，如果有人能帮我解答再好不过。
# 通过阅读官方文档，其中提到“Pod中的应用均使用相同的命名空间及端口”，那么我猜测进入pod后ps aux能查询到所有containers的进程（PID不会重复）。另外有其他大佬的回答：当你创建了一个包含两个容器的Pod时，k8s创建了2个容器，并将他们划到一组里，这个组就是Pod的概念，并不是创建了一个类似虚拟机的Pod，pod里面再创建2个容器，所以不存在你说的分层的概念，你进去到Pod中，就是进入了Pod中的某一个容器中，ps只能查看这个容器中的进程，看不到pod中其他容器中的进程。你要把容器看成一个整体，不需要关心容器中的进程。

---

# Helm
Helm是一个Kubernetes应用包管理工具，类似yum、apt、brew。
Helm使用chart来封装kubernetes应用的YAML文件，我们只需要设置自己的参数，就可以实现自动化的快速部署应用。
Helm有一个跟dockerHub类似的应用中心，网址是 https://artifacthub.io/
它有3个组件：
  1、Chart
  Helm的应用包，类似于rpm。
  2、Repository
  应用仓库，不同应用放在不同的仓库。
  3、Release
  实例名称，安装应用时要指定，运行chart都会产生，一个chart通常可以在同一个集群中安装多次，每一次安装都会创建一个新的release，release name不能重复。
安装方法：
0、如果环境是k3s，则运行export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
1、下载tar.gz包
2、解压tar.gz包
3、mv linux-amd64/helm /usr/local/bin/helm
4、运行helm help测试是否安装成功

# RuoYi-Vue
若依是一个JavaWeb后台管理系统，包含用户、角色、权限、部门、菜单、日志管理等功能。它的架构比较有代表性，后端基于SpringBoot，前端使用Vue。以分离版若依作为部署对象，更贴近我们的工作场景。支持集群，支持多数据源

# initContainer
初始化容器与启动顺序，在spec中配置，Pod中的初始化容器再应用容器之前启动，初始化容器为执行完成，应用容器不会启动，多个初始化 容器按顺序执行，前一个执行完成才会执行下一个。配置参考如下：
# 下面的例子是无限循环等待后端服务启动，如果想学习次数等待，请参考https://www.bilibili.com/video/BV16g411s7KK?p=10
spec: 
  initContainer: 
    - name: wait-for-ruoyi-admin
      image: nginx:1.22
      command:
        - sh
        - -c
        - |
            until curl -m 3 ruoyi-admin:8080
            do
              echo waiting for ruoyi-admin;
              sleep 5;
            done

# registry/harbor
私有镜像仓库服务，一般有registry/harbor。

关于为kubernetes搭建本地镜像仓库，还是会使用到dokcer，不过docker可以不用跟kubernetes发生太大关系。此次改变带来了一个不同的环境，这不同于我们常用的 Docker 交互方式。 你在开发环境中用的 Docker 和你 Kubernetes 集群中的 Docker 运行时无关。 我们知道这听起来让人困惑。 对于开发人员，Docker 从所有角度来看仍然有用，就跟这次改变之前一样。 Docker 构建的镜像并不是 Docker 特有的镜像——它是一个 OCI（开放容器标准）镜像。 任一 OCI 兼容的镜像，不管它是用什么工具构建的，在 Kubernetes 的角度来看都是一样的。 containerd 和 CRI-O 两者都知道怎么拉取并运行这些镜像。 这就是我们制定容器标准的原因。