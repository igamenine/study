# 查看端口占用情况
lsof -i:port
lsof -i:1521

# 查看deleted文件占用情况
lsof -n path|grep deleted
lsof -n /app|grep deleted

# 查看某个用户进程占用情况
lsof -u UID
lsof -u root


# 使用lsof批量kill进程
# 以下例子是为了关闭被放弃（删除）的文件所占用的进程释放空间
for i in `lsof -n /app|grep deleted|grep container|awk '{print $2}'`; do kill $i; done

# 查看目录占用情况（仅当前目录）
lsof filename

# 查看目录占用情况（所有子目录）
lsof +D filename