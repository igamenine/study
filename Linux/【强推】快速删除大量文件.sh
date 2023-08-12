# 原理是创建空目录，使用rsync将空目录与要删除的目录做同步操作，删除空目录 --delete-before 接收者在同步文件之前进行删除操作 -d 不递归到目录
mkdir blank
rsync --delete-before -d blank/ rm/
# 这个命令很强大，强推，建议刻进脑子里