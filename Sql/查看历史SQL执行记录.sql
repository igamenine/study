-- mysql
-- log_output=’FILE’ 表示将日志存入文件,默认值是FILE　 
-- log_output=’TABLE’表示将日志存入数据库,这样日志信息就会被写入到 mysql.general_log 表中.
-- 将日志写入表中
SET GLOBAL log_output = 'TABLE';
-- 开启日志
SET GLOBAL general_log = 'ON'; 
-- 查询日志
SELECT * FROM mysql.general_log ORDER BY event_time DESC;
-- mysql.general_log 表不允许使用 DELETE 进行清空操作，否则出现以下报错，所以只能使用 TRUNCATE
TRUNCATE TABLE mysql.general_log;
-- 关闭日志
SET GLOBAL general_log = 'OFF';
-- 转自https://blog.csdn.net/chenlu5201314/article/details/107790243


-- oracle
-- 记录可能有延迟
SELECT
	PARSING_SCHEMA_NAME AS user_name,
	sql_text,
	sql_id,
	LAST_ACTIVE_TIME AS active_time
	FROM v$sql WHERE PARSING_SCHEMA_NAME = 'SYSTEM'
ORDER BY LAST_ACTIVE_TIME DESC;
