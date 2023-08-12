# 注意：使用dd生成指定大小文件需要查看内存free是否足够
free -h
dd if=/dev/urandom of=test.file bs=25MB count=1