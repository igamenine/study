Capabilities 机制是在 Linux 内核 2.2 之后引入的，原理很简单，就是将之前与超级用户 root（UID=0）关联的特权细分为不同的功能组，Capabilites 作为线程（Linux 并不真正区分进程和线程）的属性存在，每个功能组都可以独立启用和禁用。其本质上就是将内核调用分门别类，具有相似功能的内核调用被分到同一组中。

这样一来，权限检查的过程就变成了：在执行特权操作时，如果线程的有效身份不是 root，就去检查其是否具有该特权操作所对应的 capabilities，并以此为依据，决定是否可以执行特权操作。

Capabilities 可以在进程执行时赋予，也可以直接从父进程继承。所以理论上如果给 nginx 可执行文件赋予了 CAP_NET_BIND_SERVICE capabilities，那么它就能以普通用户运行并监听在 80 端口上。



转自https://blog.csdn.net/alex_yangchuansheng/article/details/102796001

可以理解为rules（角色）。