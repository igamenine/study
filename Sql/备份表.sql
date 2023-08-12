-- mysql
-- mysql需要提前复制表结构
create table tablename_bak like tablename;
insert into tablename_bak select * from tablename;


-- oracle
-- 直接备份表数据
create table t_base_employee20180718 as select * from t_base_employee ;
--仅备份表结构（不含索引）
create table tablename_bak as select * from tablename where 1=0;
-- 如有索引要手动创建
insert into tablename_bak select * from tablename;
-- 通过命令需要考虑很多，建议直接使用plsql等管理工具右键导出建表语句