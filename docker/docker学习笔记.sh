为了能让外行人快速理解docker的作用，或者便于初学者理解，可以将docker类比成虚拟机，但是docker其实不是虚拟机，它利用UnionFS技术合并并挂载了宿主机内核的系统目录与自己的目录以及用户能额外挂载的目录，利用linux的cgroup和namespace隔离，利用的还是Linux宿主机的内核，本质是个隔离的进程，如果宿主机不是linux发行版系统，则需要安装dockerdesktop模拟一个Linux内核。
Docker 使用 Google 公司推出的 Go 语言 进行开发实现，基于 Linux 内核 的cgroup，namespace，以及AUFS类的UnionFS（联合文件系统）等技术，对进程进行封装隔离，属于操作系统层面的虚拟化技术。 由于隔离的进程独立于宿主和其它的隔离的进程，因此也称其为容器。
docker并没有和虚拟机一样利用一个完全独立的Guest OS实现环境隔离，它利用的是目前linux内核本身支持的容器方式实现资源和环境隔离。简单的说，docker利用namespace实现系统环境的隔离；利用Cgroup实现资源限制；利用UnionFS镜像实现根目录环境的隔离。

# UnionFS
# 转自https://www.jianshu.com/p/3ba255463047
联合文件系统（Union File System）：2004年由纽约州立大学石溪分校开发，它可以把多个目录(也叫分支)内容联合挂载到同一个目录下，而目录的物理位置是分开的。UnionFS允许只读和可读写目录并存，就是说可同时删除和增加内容。UnionFS应用的地方很多，比如在多个磁盘分区上合并不同文件系统的主目录，或把几张CD光盘合并成一个统一的光盘目录(归档)。另外，具有写时复制(copy-on-write)功能UnionFS可以把只读和可读写文件系统合并在一起，虚拟上允许只读文件系统的修改可以保存到可写文件系统当中。Linux各发行版实现的UnionFS各不相同，所以Docker在不同linux发行版中使用的也不同。可以使用docker info|grep Storage查询自己系统的存储设备驱动。最终，这8个层都被联合挂载到/var/lib/docker/aufs/mnt目录下，表现为一个完整的操作系统和golang环境供容器使用。

# whiteout属性为UnionFS的特殊文件权限属性
一般来说只读目录都会有whiteout的属性，所谓whiteout的意思，就是如果在union中删除的某个文件，实际上是位于一个readonly的目录上，那么，在mount的union这个目录中你将看不到这个文件，但是readonly这个层上我们无法做任何的修改，所以，我们就需要对这个readonly目录里的文件作whiteout。AUFS的whiteout的实现是通过在上层的可写的目录下建立对应的whiteout隐藏文件来实现的。

5）来看一个docker容器
我们一起来执行如下命令：

#启动一个容器
$ docker run -dt golang:1.8.3 /bin/sh
7bcd61b6ccd79a7367cb9872015ad20871be5b44f8bad74d35e045c89b610f34

#通过上面容器id查看挂载点
$ ls /var/lib/docker/image/aufs/layerdb/mounts/7bcd61b6ccd79a7367cb9872015ad20871be5b44f8bad74d35e045c89b610f34 
init-id  mount-id  parent
$ cat /var/lib/docker/image/aufs/layerdb/mounts/7bcd61b6ccd79a7367cb9872015ad20871be5b44f8bad74d35e045c89b610f34/mount-id 
e4e2f1159f512ab74a6afbfeca51413cc3b6a24e86caccf91e40a9d611ce0a9b# 
可以看到容器挂载的目录是e4e2f1159f512ab74a6afbfeca51413cc3b6a24e86caccf91e40a9d611ce0a9b，那么找到该目录，看看里面的文件都有些什么：

$ ls /var/lib/docker/aufs/mnt/e4e2f1159f512ab74a6afbfeca51413cc3b6a24e86caccf91e40a9d611ce0a9b                   
bin  dev  etc  go  go%  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
一个完整的操作系统根目录出现在里面。我们再来看看这个rootfs联合挂载的层级结构：

# 通过上面找到的mount-id查看aufs的内部id(也叫si)
$ cat /proc/mounts |grep e4e2f1159f512ab74a6afbfeca51413cc3b6a24e86caccf91e40a9d611ce0a9b
none /var/lib/docker/aufs/mnt/e4e2f1159f512ab74a6afbfeca51413cc3b6a24e86caccf91e40a9d611ce0a9b aufs rw,relatime,si=63e50947768841ec,dio,dirperm1 0 0

# 然后通过si查看layer
$ cat /sys/fs/aufs/si_63e50947768841ec/br[0-9]*
/var/lib/docker/aufs/diff/e4e2f1159f512ab74a6afbfeca51413cc3b6a24e86caccf91e40a9d611ce0a9b=rw
/var/lib/docker/aufs/diff/e4e2f1159f512ab74a6afbfeca51413cc3b6a24e86caccf91e40a9d611ce0a9b-init=ro
/var/lib/docker/aufs/diff/974a7e81b15c1eb6ea6c3c66dfb50dfcdf7b99b1e6458e2d3dca9451e2414106=ro
/var/lib/docker/aufs/diff/fd68755d715f47edc7f5ceaa2e5dc6788d4ca36a4d50f51a92a53045cd0b9fb1=ro
/var/lib/docker/aufs/diff/0e1237afa6d0fff72d9fdd5f84ef7275b1a49448d7523d590686131a3b129496=ro
/var/lib/docker/aufs/diff/440bf3d93514f6a35bd99d4ac098d9b709e878146e355c670bd8f1f533c185c5=ro
/var/lib/docker/aufs/diff/57e27832290597d0c5f2dc2ab55d1c53a7aa8a2a40eb6d21d014ad1210b1bb6f=ro
/var/lib/docker/aufs/diff/55da955ef5752f9c3d1810a7b23e0325dd7947a0c0aaecf6ae373f3e33979143=ro
由此我们找到了每个增量rootfs(即layer)所在的目录，那么现在你可以在容器里执行上面UnionFS中实验过的增删改，看看在最终被修改的layer是哪个，这里就不一一实验了。从上面可以看到容器的layer一共有8层：

第一部分 只读层
它是这个容器的rootfs最下面的6层（xxx=ro结尾）。可以看到，它们的挂载方式都是只读的（ro+wh，即readonly+whiteout，上面已经讲过一般来说只读目录都会有whiteout属性）。

第二部分 Init层
它是一个以“-init”结尾的层，夹在只读层和读写层之间。Init层是Docker项目单独生成的一个内部层，专门用来存放/etc/hosts、/etc/resolv.conf等信息。需要这样一层的原因是，这些文件本来属于只读的系统镜像层的一部分，但是用户往往需要在启动容器时写入一些指定的值比如hostname，所以就需要在可读写层对它们进行修改。可是，这些修改往往只对当前的容器有效，我们并不希望执行docker commit时，把这些信息连同可读写层一起提交掉。所以，Docker做法是，在修改了这些文件之后，以一个单独的层挂载了出来。而用户执行docker commit只会提交可读写层，所以是不包含这些内容的。

第三部分 可读写层
它是这个容器的rootfs最上面的一层，它的挂载方式为：rw，即read write。在没有写入文件之前，这个目录是空的。而一旦在容器里做了写操作，你修改产生的内容就会以增量的方式出现在这个层中。删除ro-wh层等文件时，也会在rw层创建对应的个whiteout文件，把只读层里的文件“遮挡”起来。最上面这个可读写层的作用，就是专门用来存放你修改rootfs后产生的增量，无论是增删改，都发生在这里。而当我们使用完了这个被修改过的容器之后，还可以使用docker commit和push指令，保存这个被修改过的可读写层，并上传到Docker Hub上，供其他人使用。而与此同时，原先的只读层里的内容则不会有任何变化。这，就是增量rootfs的好处。

最终，这8个层都被联合挂载到/var/lib/docker/aufs/mnt目录下，表现为一个完整的操作系统和golang环境供容器使用。


# Namespace
# 转自https://www.jianshu.com/p/2cd642e88344
Linux提供如下Namespace:

Namespace   Constant          Isolates              Chinese
Cgroup      CLONE_NEWCGROUP   Cgroup root directory Cgroup根目录
IPC         CLONE_NEWIPC      System V IPC, POSIX message queues  POSIX消息队列
Network     CLONE_NEWNET      Network devices, stacks, ports, etc.  网络、栈、端口等
Mount       CLONE_NEWNS       Mount points          挂载点
PID         CLONE_NEWPID      Process IDs           进程号
User        CLONE_NEWUSER     User and group IDs    用户和用户组
UTS         CLONE_NEWUTS      Hostname and NIS domain name  主机名和NIS域名

以上Namespace分别对进程的 Cgroup root、进程间通信、网络、文件系统挂载点、进程ID、用户和组、主机名域名等进行隔离。

创建容器（进程）主要用到三个系统调用：

clone() – 实现线程的系统调用，用来创建一个新的进程，并可以通过上述参数达到隔离
unshare() – 使某进程脱离某个namespace
setns() – 把某进程加入到某个namespace


# Cgroups
# 转自https://www.jianshu.com/p/fd6bb46d8659
在Linux中，Cgroups给用户暴露出来的操作接口是文件系统，即它以文件和目录的方式组织在操作系统的/sys/fs/cgroup路径下。在我的centos服务器下，用mount指令把它们展示出来：

//CentOS Linux release 7.5.1804
$ mount -t cgroup
cgroup on /sys/fs/cgroup/systemd type cgroup (rw,nosuid,nodev,noexec,relatime,xattr,release_agent=/usr/lib/systemd/systemd-cgroups-agent,name=systemd)
cgroup on /sys/fs/cgroup/cpu,cpuacct type cgroup (rw,nosuid,nodev,noexec,relatime,cpuacct,cpu)
cgroup on /sys/fs/cgroup/blkio type cgroup (rw,nosuid,nodev,noexec,relatime,blkio)
cgroup on /sys/fs/cgroup/pids type cgroup (rw,nosuid,nodev,noexec,relatime,pids)
cgroup on /sys/fs/cgroup/devices type cgroup (rw,nosuid,nodev,noexec,relatime,devices)
cgroup on /sys/fs/cgroup/freezer type cgroup (rw,nosuid,nodev,noexec,relatime,freezer)
cgroup on /sys/fs/cgroup/cpuset type cgroup (rw,nosuid,nodev,noexec,relatime,cpuset)
cgroup on /sys/fs/cgroup/memory type cgroup (rw,nosuid,nodev,noexec,relatime,memory)
cgroup on /sys/fs/cgroup/net_cls,net_prio type cgroup (rw,nosuid,nodev,noexec,relatime,net_prio,net_cls)
cgroup on /sys/fs/cgroup/perf_event type cgroup (rw,nosuid,nodev,noexec,relatime,perf_event)
cgroup on /sys/fs/cgroup/hugetlb type cgroup (rw,nosuid,nodev,noexec,relatime,hugetlb)

可以看到，在/sys/fs/cgroup下面有很多诸如cpuset、cpu、 memory这样的子目录，也叫子系统。这些都是我这台机器当前可以被Cgroups进行限制的资源种类。而在子系统对应的资源种类下，你就可以看到该类资源具体可以被限制的方法。

# 使用非root用户运行容器
# 转自https://cloud.tencent.com/developer/article/1749746
# 原则上docker都默认以root用户（或者sudo）运行，尽管docker将容器隔离了，但基于docker的原理需要root权限对/sys/fs/cgroup目录进行读写需要必须使用root，也因此image的author们也习惯于容器本身也是root用户，所以使用第三方image构建容器都很难摆脱root用户带来的一定安全性的问题（尽管不是很重要）。
# 我们在构建自己的image的时候可以尝试指定user用户，在dockerfile中配置以下信息：

# Create Windows user in the container
RUN net user /add newuser
# Set it for subsequent commands
USER newuser

# 运行容器的时候覆盖用户 ID：
# $ docker run -it --user 4000 postgres sh
# whoami
whoami: cannot find name for user ID 4000
# id -u
4000

# 特权模式
# 转自https://cloud.tencent.com/developer/article/1749746
--privileged/--privileged=true 标志可以将我们前面看到的0的用户 ID 直接映射到主机的用户 ID 0上，使其可以不受限制地访问任何自己的系统调用。在正常的操作中，即使容器内有 root，Docker 也会限制容器的 Linux Capabilities 的，这种限制包括像 CAP_AUDIT_WRITE 这样的东西，它允许覆盖内核的审计日志--你的容器化工作负载很可能不需要这个 Capabilities。所以特权只应该在你真正需要它的特定设置中使用，简而言之，它给容器提供了几乎所有主机（作为root）可以做的事情的权限。

本质上，它就是一个免费的通行证，可以逃避容器所包含的文件系统、进程、sockets  套接字等，当然它有特定的使用场景，比如在很多 CI/CD 系统中需要的 Docker IN Docker 模式（在 Docker 容器内部需要 Docker 守护进程），以及需要极端网络的地方。即便如此，也有一些方法可以避免使用特权模式，例如，我们可以使用谷歌创建的名为 Kaniko 的工具来替代特权模式的容器。

如果我们在运行容器时没有声明--privileged，那么如sysctl kernel.hostname=Attacker的命令时无法使用的，声明了--privileged后，就可以对kernel的容器内的hostname进行更改。


如果我们在 Kubernetes 中要使用的话可以使用 SecurityContext 来进行配置：

spec:
  SecurityContext:
    privileged: true

此外 Kubernetes 还包含一个名为 PodSecurityPolicy 的资源对象，它是一个准入控制器（Kubernetes 在允许容器进入集群之前会它进行检查），强烈建议的一项策略就是配置不允许特权模式的 Pod:

kind: PodSecurityPolicy
spec:
  privileged: false