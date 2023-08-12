-- mysql
drop table table_name;
truncate table table_name;
-- 注意：如果删除大表命令执行比较慢，删除时会锁表而不会通知应用层，导致应用层在删除期间认为表依然存在导致系统异常，如果想加快删除速度那就要找到表文件创建相应的硬链接，让mysql可以更快的删除表，然后用户再手动rm的方式删除表文件即可。更多神奇操作参见https://blog.csdn.net/anzhen0429/article/details/76284320，总的来说可以通过截断的方式缩小等待时间
-- truncate -s 1024 * 1024 * 4 filename

-- 通过有条件的delete不会主动释放空间，这时候需要以下语句释放表空间
optimize table table_name;
-- 如果是innodb引擎，则使用以下语句重构表来释放表空间
alter table tab_name  ENGINE = 'InnoDB';

-- 查看数据表空间
SELECT CONCAT(table_schema,'.',table_name) AS 'Table Name',
CONCAT(ROUND(table_rows/1000000,2),'M') AS 'Number of Rows',
CONCAT(ROUND(data_length/(1024*1024*1024),2),'G') AS 'Data Size',
CONCAT(ROUND(index_length/(1024*1024*1024),2),'G') AS 'Index Size' ,
CONCAT(ROUND((data_length+index_length)/(1024*1024*1024),2),'G')
AS'Total'FROM information_schema.TABLES
WHERE table_schema LIKE 'database';

-- Oracle
-- 删除表 : 使用 DROP TABLE table_name 即可
DROP TABLE table_name;
-- 截断表
TRUNCATE TABLE table_name;
-- 使用 TRUNCATE 可以高效的删除表中的所有数据并回收空间，而不从数据库中删除删除表的定义
-- 从  Oracle10g 开始，删除表仍保留表空间，可以在 "回收站" 中来访问，如果要从回收站中清除，使用 PURGE 子句
DROP TABLE table_name PURGE;
-- 如果表已经删除，可以从 "回收站" 中清除所占的空间
PURGE TABLE table_name;
-- 清除 "回收站" 中所有内容
PURGE RECYCLEBIN;

-- 释放通过delete冗余的表空间
-- 1.开启允许行移动, 此操作后允许rowid改变。
alter table table_name enable row movement;
-- 2.回收空间。
alter table table_name shrink space;

-- 记得提交
commit;

-- 查看表空间
SELECT 
       A.TABLESPACE_NAME "表空间名",
       TOTAL "表空间大小",
       FREE "表空间剩余大小",
       (TOTAL - FREE) "表空间使用大小",
       TOTAL / (1024 * 1024 * 1024) "表空间大小(G)",
       FREE / (1024 * 1024 * 1024) "表空间剩余大小(G)",
       (TOTAL - FREE) / (1024 * 1024 * 1024) "表空间使用大小(G)",
       ROUND((TOTAL - FREE) / TOTAL, 4) * 100 "使用率 %"
FROM   (SELECT TABLESPACE_NAME,
               SUM(BYTES) FREE
        FROM   DBA_FREE_SPACE
        GROUP  BY TABLESPACE_NAME) A,
       (SELECT TABLESPACE_NAME,
             --  file_name,
               SUM(BYTES) TOTAL
        FROM   DBA_DATA_FILES
        GROUP  BY TABLESPACE_NAME/*,file_name*/) B
WHERE  A.TABLESPACE_NAME = B.TABLESPACE_NAME;

-- 查看数据表空间
select segment_name as "表名", bytes/1024/1024 AS "表大小(M)" from user_segments where segment_type = 'TABLE' and segment_name='TEST'; 