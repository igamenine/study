Make install安装的软件卸载方法
在安装包目录 make uninstall 如果对应安装目录没有被删除，就直接rm对应安装目录

如果当时安装的时候./configure没有配置--prefix选项，源码包也没有提供make uninstall，则可以通过以下方式可以完整卸载：
 
找一个临时目录重新安装一遍，如：
$ ./configure --prefix=/tmp/to_remove && make install
 

然后遍历/tmp/to_remove的文件，删除对应安装位置的文件即可（因为/tmp/to_remove里的目录结构就是没有配置--prefix选项时的目录结构）。
