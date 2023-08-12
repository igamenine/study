create table b as select * from a ;

insert into B select * from A; ;

insert into B(字段名)(select 字段名 from A) ;

insert into b.B select * from a.A ;


-- 如果要保留表结构需要提前建表
-- mysql
create table b like a;

-- oracle
-- 由于Oracle的索引单独管理不允许重名所以需要重新建立
create table b as select * from a where 1=0;
create index index_name on a(cloumn_name);
