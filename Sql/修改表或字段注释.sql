-- mysql
alter table tablename commit '表的注释信息';
alter table tablename modify column coltype commit '字段的注释信息';

-- oracle
comment on table tablename is '表的注释信息';
comment on column tablename.column is '字段的注释信息';