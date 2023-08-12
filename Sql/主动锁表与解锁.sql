-- mysql
-- 锁定数据表，避免在备份过程中，表被更新
LOCK TABLES tbl_name READ;
-- 为表增加一个写锁定：
LOCK TABLES tbl_name WRITE;
-- 解锁
unlock tables;
