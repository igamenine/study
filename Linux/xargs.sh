# xargs 可以将管道或标准输入（stdin）数据转换成命令行参数，也能够从文件的输出中读取数据。同时可以方便的替换空格和回车符
# 之所以能用到这个命令，关键是由于很多命令不支持|管道来传递参数，而日常工作中有有这个必要，所以就有了 xargs 命令，例如：
find /sbin -perm +700 |ls -l       #这个命令是错误的
find /sbin -perm +700 |xargs ls -l   #这样才是正确的
# 命令格式：
somecommand |xargs -item  command


# 多行转单行 列转行
cat test.txt | xargs
# a b c d e f g h i j k l m n o p q r s t u v w x y z

# 多行整理输出 行转列
cat test.txt | xargs -n3
# a b c
# d e f
# ...

# 定界符
echo "nameXnameXnameXname" | xargs -dX
# name name name name

# 用 rm 删除太多的文件时候，可能得到一个错误信息：/bin/rm Argument list too long. 用 xargs 去避免这个问题：
find . -type f -name "*.log" -print0 | xargs -0 rm -f
# xargs -0 将 \0 (空字符) 作为定界符。

# 统计一个源代码目录中所有 php 文件的行数：
find . -type f -name "*.php" -print0 | xargs -0 wc -l

# 查找所有的 jpg 文件，并且压缩它们：
find . -type f -name "*.jpg" -print | xargs tar -czvf images.tar.gz

# 查找文件并移动
find . -name "*.png" |xargs -I '{}' mv {} bmp