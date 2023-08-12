-- mysql
-- 创建表格时添加：
create table table1(id int auto_increment primary key,...)
-- 创建表格后添加：
alter table table1 add id int auto_increment primary key 自增字段
-- 一定要设置为primary key.
-- 许多时候希望table中数据的id不要从1开始，像qq， id从10000开始，代码如下：
alter table users AUTO_INCREMENT=10000;
-- 而且该语句也适用于修改现有表的id上， 比如大批量删除数据后，想 id 从 654321 退回 123456 开始
alter table users AUTO_INCREMENT=123456;
-- 但是经过实际测试， 单机的Mysql没有问题， Mysql Cluster下是无效的，
-- 设置自增ID从N开始
CREATE TABLE TABLE_1 ( ID INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, -- ID列为无符号整型，该列值不可以为空，并不可以重复，而且自增。 NAME VARCHAR(5) NOT NULL ) AUTO_INCREMENT = 100;
-- （ID列从100开始自增）
-- 如果想让自增ID从默认值开始只要
TRUNCATE TABLE table1 
-- 但是注意：这个命令会清空数据包记录！
-- 平常，用类似这条命令更多些
alter table users AUTO_INCREMENT=123456;

-- Failedtoreadauto-incrementvaluefromstorageengine错误的处理方法
-- 删除自增列，添加自增列。
