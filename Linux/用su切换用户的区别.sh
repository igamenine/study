su只是切换权限
su -

su -，su -l或su --login 命令改变身份时，也同时变更工作目录，以及HOME，SHELL，USER，LOGNAME。此外，也会变更PATH变量。用su -命令则默认转换成成root用户了。

而不带参数的“su命令”不会改变当前工作目录以及HOME,SHELL,USER,LOGNAME。只是拥有了root的权限而已。