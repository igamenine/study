#CentOS7中的polkit进程因为某些原因不会释放内存，导致内存占用过高且不会释放，本命令通过重启polkit进程的方式临时解决问题，如果希望彻底解决推荐升级系统，不推荐安装补丁（因为会影响生产系统），修复方法参考https://access.redhat.com/errata/RHBA-2017:1306
service polkit restart