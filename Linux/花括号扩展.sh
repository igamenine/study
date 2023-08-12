# 花括号扩展{}会按括号内的需求遍历打印结果，结果默认以空格区分。
# 转自https://mp.weixin.qq.com/s/vH4IxXS3pMNSPCsO7YYc2A
# 主要有x类用法：
# 1、打印整数/字母序列
# 2、遍历创建文件/目录
# 3、简化备份命令
# 4、创建不同后缀的文件
# 5、简写mv命令

# 1、打印整数/字母序列
# 可递增可递减，整数支持负数，以下命令仅演示递增
# 整数递增
echo {-2..2}
# 大写字母递增
echo {A..C}
# 小写字母递增
echo {a..c}
# 偶数递增
echo {0..15..2}
# 奇数递增
echo {1..15..2}

# 2、遍历创建文件/目录
touch test_{1..10}.txt
mkdir test_{1..10}


# 3、简化备份命令
# 以下命令简写cp -p test.log test.log.bak
cp -p test.log{,.bak}
# 该命令是利用了花括号扩展会空格分离遍历结果的特性简写语法，如果你echo test.log{,.bak}会得到test.log test.log.bak 正好是cp -p test.log test.log.bak，同理当你要操作的路径是同一个路径时，你都可以用这个简写，比如mv重命名文件。
mv test.log{,.bak}

# 4、创建不同后缀的文件
touch {a,b,c}.{hpp,cpp}
# a.cpp  a.hpp  b.cpp  b.hpp  c.cpp  c.hpp
# 该命令将两边的扩展内容遍历拼接在一起，简写了for循环，如echo {1..3}{a..c}

# 5、简写mv命令
mv {old,new}/file_name
# 该命令会将old/file_name移动至new/file_name，简写了mv old/file_name new/file_name，还是利用了遍历结果的特性

