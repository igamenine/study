# 在使用C++之前，要确保系统上已安装gcc或其他编译器，本文以gcc为主
# 安装gcc
yum install -y gcc gcc-c++
# 编译cpp文件
# appname就是程序名称，filename是cpp文件名称，编译好的appname可以直接./appname执行
g++ -o appname filename
# 指定程序编译环境版本
g++ -std=c++11 -o appname filename
# 不允许优化，强制g++调用复制构造函数
g++ -o appname -fno-elide-constructors filename