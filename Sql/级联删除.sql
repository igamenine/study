-- 级联删除是指当主表(parent table)中的一条记录被删除。子表中关联的记录也对应的自己主动删除。
-- 外键的级联删除能够在创建表时定义，也能够使用ALTER TABLE语法定义。
-- 语法：
CREATE TABLE table_name
(
    column1 datatype null/not null,
    column2 datatype null/not null,
    ...
    CONSTRAINT fk_column
          FOREIGN KEY (column1,column2,...column_n)
          REFERENCES parent_table (column1, column2,... column_n)
          ON DELETE CASECADE
);
-- 演示样例：
create table tb_supplier
(
  supplier_id number not null,
  supplier_name varchar2(50) not null,
  contact_name varchar2(50),
  CONSTRAINT pk_supplier PRIMARY KEY (supplier_id)
);

create table tb_products
(
  product_id number not null,
  product_name varchar2(100),
  supplier_id number not null,
  constraint fk_products_supplier 
     foreign key (supplier_id) 
     references tb_supplier(supplier_id)
     on delete cascade
);

-- 使用ALTER TABLE语法定义级联删除
-- 语法：
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
      FOREIGN KEY (column1, column2,... column_n)
      REFERENCES parent_table (column1, column2, ... column_n)
      ON DELETE CASCADE;

-- 转自https://www.cnblogs.com/claireyuancy/p/7399677.html