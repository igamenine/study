# find命令用来在指定目录下查找文件。任何位于参数之前的字符串都将被视为欲查找的目录名。如果使用该命令时，不设置任何参数，则find命令将在当前目录下查找子目录与文件。并且将查找到的子目录和文件全部进行显示。
#-exec直接执行 -ok执行之前询问用户
find [路径] [选项] [执行语句]
find path [-option] [-exec/-ok]

# -name name, -iname name : 文件名称符合 name 的文件。iname 会忽略大小写
# -mtime n : 在过去 n 天内修改过的文件，+号表示计量以上。
# -size n : 文件大小 是 n 单位，b/k/M/G常用大小计量，+号表示计量以上。
# -type c : 文件类型是 c 的文件，f普通文件，d目录。
# -cmin n : 在过去 n 分钟内被修改过
# -path [path] -prune -o : 忽略目录，注意目录名最后不要有/号
find . -path "./.git" -prune -o -type f -mtime -90

# 在某些版本的linux下，通过find查找当前目录下所有后缀名jpg的文件，命令为
find ./ -iname *.jpg
# 会出现“find: 路径必须在表达式之前”的错误提示。解决的方法有两种
# 1.	使用转义符把*转义，即  \*.jpg
# 2.	用引号引起来 ，即 “*.jpg”


#例子
find . -name "*.c" #将当前目录及其子目录下所有文件后缀为 .c 的文件列出来
find . -type f #将当前目录及其子目录中的所有文件列出
find ./ -mtime 3 #查找3天前更改过的文件
find ./ -mtime -3 #查找3天内更改过的文件
find ./ -mtime 0 #查找今天更改过的文件
find ./ -newer sort.txt #查找比sort.txt修改时间更新的文件
find ./ -anewer sort.txt #查找比sort.txt访问时间更新的文件
find ./ -amin  5 #查找5分钟之前访问过的文件
find . -type f -perm 644 -exec ls -l {} \; #查找当前目录中文件属主具有读、写权限，并且文件所属组的用户和其他用户具有读权限的文件