-- mysql
drop table if exists table_name;
CREATE TABLE test_dropifexists(a int);
SELECT * FROM test_dropifexists;

-- oracle
-- CREATE TABLE xq.test_dropifexists(a int);
-- SELECT * FROM xq.test_dropifexists;
declare
      num   number;
begin
    select count(1) into num from all_tables where owner = upper('xq') AND table_name = upper('test_dropifexists');
    if num > 0 then
        execute immediate 'drop table xq.test_dropifexists' ;
    end if;
end;
CREATE TABLE xq.test_dropifexists(a int);
SELECT * FROM xq.test_dropifexists;

-- 拓展：Oracle有3张系统视图，分别是：
-- user_tables 当前用户表
-- all_tables 可查询用户表
-- dba_tables 所有表（普通用户无权限查看）