# 注意：日志要配合crontab定时清理
/home/data-integration/kitchen.sh -file=/etc/scs/syncd/kettle/k1_itni_violation/postgresqltomysql.kjb -level=Rowlevel -logfile=/var/scs/logs/sync/kettle_log_k1/syncd.log
