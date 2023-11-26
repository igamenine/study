# 批量筛选(并集筛选，或的关系)
df -h|grep -E 'docker|dev'
# 批量排除(并集筛选，或的关系)
df -h|grep -v 'docker\|dev'
ls|grep -v 'init\|l'
# 查询日志文件内中文
grep -P '[\p{Han}]' test.log  