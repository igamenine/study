-- 主键 (Primary Key) 中的每一笔资料都是表格中的唯一值。换言之，它是用来独一无二地确认一个表格中的每一行资料。主键可以是原本资料内的一个栏位，或是一个人造栏位 (与原本资料没有关系的栏位)。主键可以包含一或多个栏位。当主键包含多个栏位时，称为组合键 (Composite Key)。
-- MySQL:
CREATE TABLE Customer
(SID integer,
Last_Name varchar(30),
First_Name varchar(30),
PRIMARY KEY (SID));
CREATE TABLE Customer
(SID integer PRIMARY KEY,
Last_Name varchar(30),
First_Name varchar(30));
-- Oracle:
CREATE TABLE Customer
(SID integer PRIMARY KEY,
Last_Name varchar(30),
First_Name varchar(30));
-- SQL Server:
CREATE TABLE Customer
(SID integer PRIMARY KEY,
Last_Name varchar(30),
First_Name varchar(30));
-- 以下则是以改变现有表格架构来设定主键的方式：
-- MySQL:
ALTER TABLE Customer ADD PRIMARY KEY (SID);
-- Oracle:
ALTER TABLE Customer ADD PRIMARY KEY (SID);
-- SQL Server:
ALTER TABLE Customer ADD PRIMARY KEY (SID);

-- 删除主键
-- MySQL：
ALTER TABLE Persons
DROP PRIMARY KEY
-- SQL Server / Oracle / MS Access：
ALTER TABLE Persons
DROP CONSTRAINT pk_PersonID

-- 请注意，在用 ALTER TABLE 语句来添加主键之前，我们需要确认被用来当做主键的栏位是设定为 『NOT NULL』 ；也就是说，那个栏位一定不能没有资料。

-- 使用约束添加主键，mysql中使用后没有保留名字，创建的主键依旧只能通过一般方法删除，所以没有意义
alter table schema_test.primary_test add constraint pk1 primary key (pk);
