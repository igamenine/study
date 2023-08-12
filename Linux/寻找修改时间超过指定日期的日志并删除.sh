find /home/magic/logs/job_center/jobhandler/2020-09-23 -type f -mtime +2 -name "*log" -exec rm -rf {} \;
find ./ -type d -name "2018*" -mtime +10 -exec rm -rf {} \;
find ./ -type f -name "*_*" -mtime +730  -exec rm -rf {} \;
find ./ -type f -name "*.xlsx" -mtime +60  -exec mv {} /home/export_backup \;

# 可以配置到crontab中定时删除日志文件

# 清理scsdbserver错误日志
for i in `find /var/scs/logs/scsdbserver -name DBlog_\*.err`; do cat /dev/null > $i; done
# 清理docker缓存日志
find /var/lib/docker/containers -name \*.log -exec sh /home/docker_clear.sh '{}' \;
