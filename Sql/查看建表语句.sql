-- mysql
show create table tablename;


-- oracle
-- 需要前往对应用户下查找，无索引，通过命令需要考虑很多，建议直接使用plsql等管理工具右键导出建表语句
select dbms_metadata.get_ddl('TABLE','tablename') from dual;