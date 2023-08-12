ls /var/scs/logs/scsdb2server|grep scsdb2server.log.|awk '{print "'' > "$1}'|sh
ls /var/scs/logs/scsdb2server|grep Audit.log.|awk '{print "'' > "$1}'|sh

# 批量删除日志
for i in `find /opt -name *.log`; do cat /dev/null > $i; done
for i in `find -type f -name "zeppelin-interpreter-flink-*.log" -size +30G`; do cat /dev/null > $i; done

# 删除空文件
find . -name "*" -type f -size -1024c | xargs -n 1 rm -f