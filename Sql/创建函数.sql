-- mysql
CREATE FUNCTION hello (s CHAR(20))
RETURNS CHAR(50) DETERMINISTIC
RETURN CONCAT('Hello, ',s,'!');

CREATE FUNCTION `test`() RETURNS varchar(20)
    DETERMINISTIC
BEGIN
	declare c varchar(20);
  select a into c from test limit 1;
RETURN c;
END

-- 通常mysql函数需要在returns后添加声明提醒优化器做出正确的执行计划，如：
-- DETERMINISTIC 如果一个例程对于相同的输入参数总是产生相同的结果，那么它 被认为是“确定性的” ，否则被认为是“不确定的”（NOT DETERMINISTIC）
-- CONTAINS SQL表示子程序不包含读或写数据的语句。如果没有显式给出这些特征，这是默认值。
-- NO SQL表示子程序不包含SQL语句。
-- READS SQL DATA表示子程序包含读数据(select)的语句，但不包含写数据的语句。
-- MODIFIES SQL DATA表示子程序包含写数据(insert/delete)的语句。
-- 如果不想每次创建函数都声明则
-- 1、在 MySQL 数据库中执行以下语句，临时生效，重启后失效

-- set global log_bin_trust_function_creators=TRUE;
-- 2、在配置文件 my.ini 的 [mysqld] 配置，永久生效

-- log_bin_trust_function_creators=1

-- Oracle
