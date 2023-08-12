-- mysql
-- 修改表名
ALTER TABLE tablename1 RENAME TO tablename2;
-- 修改字段名
alter table [tablename] change [oldcolname] [newcolname] [newtype];
-- 修改字段类型
alter table tablename modify columnname newtype; 
-- 修改字段默认值
alter TABLE tablename ALTER COLUMN columnname set default 'defalutvalues';
-- 修改表注释
alter table tablename comment '修改后的表的注释';
-- 修改字段注释
alter table tablename modify column columnname type comment '修改后的字段注释';
-- 查看表字段结构
show full columns from tablename;

-- oracle
-- 添加列
alter table tablename add(columnname type);
-- 修改列名
alter table tablename rename column columnname1 to columnname2;
-- 修改列类型
alter table tablename modify columnname newtype; 
-- 删除列
alter table tablename drop column columnname;
-- 修改字段默认值
alter table tablename modify columnname default defalutvalues;
-- 修改表注释
comment on table tablename is '对表的说明';
-- 修改字段注释
comment on column tablename.column_name is '对表中列的说明';


--拓展阅读
1.对表的说明：
comment on table table_name is '对表的说明';
2.对表中列的说明：
comment on column table.column_name is '对表中列的说明';
3.查看表的说明
select * from user_tab_comments where table_name = 'employees';
4.查看表中列的说明
select * from user_col_comments where table_name = 'employees';
5.查看数据库中所有表中列的说明
select * from user_col_comments where comments is not null;
6.删除表级或列级说明，即时将其设置为空
comment on table employees is '';
comment on column employees.salary is '';