-- mysql
-- 标准日期格式如%Y-%m-%d %H:%i:%s
-- 将日期转换为标准时间格式
DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%s')
-- 日期筛选
[字段名] >= '[日期]'
-- 将日期转化为时间戳
SELECT UNIX_TIMESTAMP('2015-04-29 00:00:00')
-- 时间戳转化为日期
select FROM_UNIXTIME(invest_time) 
select FROM_UNIXTIME(invest_time,'%Y年%m月%d') 
SELECT FROM_UNIXTIME(1234567890, '%Y-%m-%d %H:%i:%S')
-- 时间加减
-- type值：microsecond second minute hour day week month quarter year ...
DATE_ADD(date,INTERVAL expr type)
DATE_ADD(OrderDate,INTERVAL 2 DAY) -- 添加2天
DATE_SUB(date,INTERVAL expr type)
DATE_SUB(OrderDate,INTERVAL 5 DAY) -- 减去5天

-- oracle
-- 日期筛选
to_char([字段名], 'yyyy-mm-dd hh24:mi:ss') >= '[日期]'
-- 日期转数字：
to_number(to_char(sysdate,'yyyymmdd'))
-- 时间戳转日期
SELECT TO_CHAR(时间戳的那一列 / (1000 * 60 * 60 * 24) +
TO_DATE('1970-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD')
AS createTime FROM 表名 ;

trunc(sysdate,'yyyy') --返回当年第一天.
trunc(sysdate,'mm') --返回当月第一天.
trunc(sysdate,'d') --返回当前星期的第一天.

-- hive
-- 将日期转化为时间戳
SELECT UNIX_TIMESTAMP('2015-04-29 00:00:00')
-- 时间戳转化为日期
SELECT from_unixtime(unix_timestamp());
SELECT from_unixtime(unix_timestamp(),"yyyy-MM-dd HH:mm:ss");
-- 时间加减
select DATE_ADD(current_timestamp(), 2); -- 添加2天
select date_sub(current_timestamp(), 5) --减少5天

-- flink.bsql(blinksql)
select to_timestamp('需要转换的时间戳');