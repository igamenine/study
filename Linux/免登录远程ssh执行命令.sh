# 基本执行命令案例
ssh node1 "df -h"
# 该命令不会远程登录至其他机器而是在填写密码/互信后远程执行命令并返回结果至本机，关于临时执行命令或者配合xsync批量执行命令有帮助
# 这种方法也有缺点，具体参见https://blog.csdn.net/yiduyangyi/article/details/78298325

# 执行多个命令，通过;号分割
ssh node1 "cd /home/;mkdir test"