-- 需求：我需要将性别字段内容限制成【男/女/未知】/【1/2/-1】，这时可以使用check
-- 按照目前的开发习惯，一般不在数据库层面对字段进行限制，所以用到的情况极少，仅作学习

-- mysql
create table 表名
(
  id int not null,
  check(id > 0)
);

create table 表名
(
  sex char(2) not null,
  check(sex in ('男', '女', '未知'))
);

-- SQL Server / Oracle / MS Access
create table 表名
(
sex char(2) check(sex ='男' or sex ='女' or sex= '未知') not null
);
默认性别为男的代码如下：
create table 学生表
(
学号 char(5) not null primary key,
姓名 varchar(10) not null,
性别 char(2) default '男' check (性别 in ('男', '女', '未知')) 
-- 其中default '男'  就是默认性别为男。
);


-- 如果在表已存在的情况下为 "Id_P" 列创建 CHECK 约束，请使用下面的 SQL：

-- MySQL / SQL Server / Oracle / MS Access:
ALTER TABLE Persons
ADD CHECK (Id_P>0)
-- 如果需要命名 CHECK 约束，以及为多个列定义 CHECK 约束，请使用下面的 SQL 语法：

-- MySQL / SQL Server / Oracle / MS Access:
ALTER TABLE Persons
ADD CONSTRAINT chk_Person CHECK (Id_P>0 AND City='Sandnes')


-- 如果需要命名 CHECK 约束，以及为多个列定义 CHECK 约束，请使用下面的 SQL 语法
CREATE TABLE Persons
(
Id_P int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT chk_Person CHECK (Id_P>0 AND City='Sandnes')
)

-- 如需撤销 CHECK 约束，请使用下面的 SQL，约束名会自动创建不知道可以查看建表语句：

-- SQL Server / Oracle / MS Access:
ALTER TABLE Persons
DROP CONSTRAINT chk_Person
-- MySQL:
ALTER TABLE Persons
DROP CHECK chk_Person