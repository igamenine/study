# cp的全称是copy即是复制的意思，用的比较多在linux中一般用来备份文件，不加option时之间复制文件，如
cp path_a/file_name path_b/
cp path_a/file_name path_b/file_new_name
# 复制目录
cp -r path new_path
# 将目录复制到新的目录中
cp -r path path_b/
# 覆盖时不需要询问
cp -f path_a/file_name path_b/
# 复制时保留属性（如修改日期、所属用户）
cp -p path new_path

# 我们日常使用时都会确保同名文件即相同文件，所以一般可以直接使用如下语句
cp -rf file_name path/file_name

# 其他实用扩展
# -a：此参数的效果和同时指定"-dpr"参数相同；
# -d：当复制符号连接时，把目标文件或目录也建立为符号连接，并指向与源文件或目录连接的原始文件或目录；
# -u：使用这项参数后只会在源文件的更改时间较目标文件更新时或是名称相互对应的目标文件并不存在时，才复制文件；
