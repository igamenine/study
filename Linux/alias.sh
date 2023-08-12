# 为冗长但又频繁使用的命令取别名
alias lalala="echo 啦啦啦"
# 取消别名
unalias lalala
# 永久更改
vim /etc/profile
alias lalala="echo 啦啦啦"