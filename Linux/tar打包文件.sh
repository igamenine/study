# tar 是用来建立，还原备份文件的工具程序，它可以加入，解开备份文件内的文件。
# 打包文件：
tar -zcvf 备份文件名.tgz 目录名
# 解压文件
tar -zxvf 文件名.tgz

# -z或--gzip或--ungzip 通过gzip指令处理备份文件。
# -c或--create 建立新的备份文件。
# -v或--verbose 显示指令执行过程。
# -f<备份文件>或--file=<备份文件> 指定备份文件。
# -x或--extract或--get 从备份文件中还原文件。

# tar带密码打包文件
tar -zcvf - 文件名或文件夹名|openssl des3 -salt -k 密码 | dd of=压缩加密文件名
tar -zcvf - asmrpw20221002|openssl des3 -salt -k 20221002 | dd of=asmrpw20221002.tar

# tar带密码解压文件
dd if=压缩加密文件名 |openssl des3 -d -k 密码|tar zxf -
dd if=asmrpw20221002.tar |openssl des3 -d -k 20221002|tar zxf -