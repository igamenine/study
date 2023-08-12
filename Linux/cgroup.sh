cgroup 是 Linux 内核的一个功能，用来限制、控制与分离一个进程组的资源（如CPU、内存、磁盘输入输出等）。它是由 Google 的两位工程师进行开发的，自 2008 年 1 月正式发布的 Linux 内核 v2.6.24 开始提供此能力。
cgroup 主要限制的资源是：
CPU
内存
网络
磁盘 I/O
当我们将可用系统资源按特定百分比分配给 cgroup 时，剩余的资源可供系统上的其他 cgroup 或其他进程使用。
更多参见https://zhuanlan.zhihu.com/p/434731896