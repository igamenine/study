-- 1、DML
-- DML（data manipulation language）数据操纵语言
-- SELECT、UPDATE、INSERT、DELETE
SELECT 列名称 FROM 表名称
UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 某值
INSERT INTO table_name (列1, 列2,...) VALUES (值1, 值2,....)
DELETE FROM 表名称 WHERE 列名称 = 值

-- 2、DDL
-- DDL（data definition language）数据库定义语言
-- CREATE、ALTER、DROP等
CREATE TABLE 表名称
(
列名称1 数据类型,
列名称2 数据类型,
列名称3 数据类型,
....
)

ALTER TABLE table_name
ALTER COLUMN column_name datatype

DROP TABLE 表名称
DROP DATABASE 数据库名称

-- 3、DCL
-- DCL（Data Control Language）数据库控制语言
-- grant,deny,revoke等
grant all on *.* to username;
grant select on databasename.tablename to username;