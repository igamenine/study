# 查看端口占用情况
lsof -i:1521
COMMAND    PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
docker-pr 4667 root    4u  IPv4 211344      0t0  TCP *:ncube-lm (LISTEN)
# 查看端口开放情况
# -t 显示TCP传输协议的连线状况 -u 显示UDP传输协议的连线状况 
# -n 直接使用IP地址 -l 显示监控中的服务器的Socket
# -p 显示正在使用Socket的程序识别码和程序名称。
netstat -tunlp|grep 1521
tcp        0      0 0.0.0.0:1521            0.0.0.0:*               LISTEN      4667/docker-proxy   
#netstat的替代品，性能更优
ss -tunlp
tcp    LISTEN     0      128       *:1521                  *:*                   users:(("docker-proxy",pid=4667,fd=4))