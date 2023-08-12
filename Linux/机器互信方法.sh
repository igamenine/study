# 1、传统互信方法【推荐】
ssh-keygen（如果没有秘钥则通过此命令生成，一直回车或YES）
ssh-copy-id -i ~/.ssh/id_rsa.pub root@10.164.194.42
如果报错，检查是否系统曾经免密过，使用以下命令清理老的免密内容然后添加新的：
主要命令是 ssh-keygen -R "远程连接的IP"

# 2、通过将公钥远程传送到对方机器上后填充的方法，可避免覆盖对方机器authorized_key文件的风险。
如果没有找到公钥，那么执行ssh-keygen -t rsa 按照提示操作，注意，不要输入passphrase，因为我的之前已经操作过，所以还提示了是否覆盖，输入 "y"回车就可以。其他提示信息如下 
先在服务器 S 上执行脚本 scp ~/.ssh/id_rsa.pub root@192.168.0.2:/root/.ssh/s.pub
然后在服务器 B 上执行 cat ~/.ssh/s.pub >> ~/.ssh/authorized_keys
