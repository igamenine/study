-- ORA-00907: 缺失右括号
-- 1 union all中order by 导致缺失右括号
-- 在有union all的子查询中使用了order by，会导致缺失右括号的错误，事实上在有union all的子查询中根本没必要进行排序，因为联合之后又组成了一个新的集合，之前的排序对新集合而言没什么用，直接查询联合之后的新集合然后再进行排序即可。
select * from
 (
select COLUMN_A,COLUMN_B
from TABLE_EXAMPLE_A
  union all
select COLUMN_A,COLUMN_B
from TABLE_EXAMPLE_B
) A;
order by COLUMN_A;
-- 2. in (子查询)的用法中，子查询不能使用order by
此种情况跟1中描绘的有些类似，首先在in(子查询)用法使用order by 会报错，其次，子查询里用order by，纯属多此一举，子查询的目的，只是找出合适的数据。如果需要排序，在外边排即可。
Select * from TABLE_EXAMPLE where ID in(select ID from TABLE_EXAMPLE where ID>500)oder by ID DESC
-- 3. 创建表时，提示缺失右括号
-- 3.1 创建表时关键字顺序错
-- 示例如下：
CREATE TABLE T_EXAMPLE (
 id serial primary key,
 t_id int not null default 0
 )
--  解决方案如下：
CREATE TABLE T_EXAMPLE (
 id serial primary key,
 t_id int default 0 not null
 )
-- 3.2 创建表时表中字段有关键字
-- 示例如下：
CREATE TABLE T_EXAMPLE
(
  id       number(18,0) not null,
  desc     varchar(45) not null
)
-- 解决方案如下：
-- 给对应的关键字加上双引号
CREATE TABLE T_EXAMPLE
(
  id       number(18,0) not null,
  "DESC"     varchar(45) not null
)
-- 3.3 创建表时未对表中的字段设置长度
-- 示例如下：
CREATE TABLE T_EXAMPLE
(
id bigint NOT NULL PRIMARY KEY,
name varchar NOT NULL
)
-- 解决方案如下：
CREATE TABLE T_EXAMPLE
(
id bigint NOT NULL PRIMARY KEY,
name varchar(200) NOT NULL
)
-- 3.4 创建主外键约束时外键类型跟主键类型不完全一致
-- 主外键类型不完全一致时也会报缺失右括号的错误

-- 4. SQL查询时发生缺失右括号错误
-- 在查询时引发缺失右括号错误的原因大多数在于查询语句中有关于日期的转化、过滤。很多时候都是因为关于日期类型的转化少了单引号。
-- 示例如下：
SELECT * FROM T_EXAMPLE Where T_DATE in(2015-01-20 22:37)
-- 解决方案如下：
SELECT * FROM T_EXAMPLE Where T_DATE in('2015-01-20 22:37')
-- 还有一种情况就是在where过滤中进行时间的转化时，有时候在sql/plus中直接执行没问题，但是在程序中却会出现错误。
-- 示例如下：
SELECT * FROM T_EXAMPLE Where 
ID in(select ID From T_EXAMPLE_B where D_DATE>=TO_DATE('2015-01-20','yyyy-mm-dd'))
-- 该语句在数据库直接执行是没问题的，但是在程序中执行传入日期参数时有时会报缺失右括号的错误，为了解决这个问题，我们可以改变传入的日期参数的格式，如下：
SELECT * FROM T_EXAMPLE Where 
ID in(select ID From T_EXAMPLE_B where D_DATE>=TO_DATE(20150120,'yyyy-mm-dd'))
-- 还有一种关于oracle日期格式的错误是：ORA-01840: 输入值对于日期格式不够长
-- 示例如下：
select to_date(2015-01-01,'yyyy-mm-dd') from dual
-- 为了解决这个问题，我们也可以用改变传入的日期参数的格式，来解决，如下：
select to_date(20150101,'yyyy-mm-dd') from dual
-- 5. 其他导致缺失右括号的原因
-- 5.1 书写错误，确实缺少了一个括号
-- 5.2 字段名缺少双引号
-- 如果在创建表时，表字段名全部是大写，则不存在此问题
-- 转自https://www.cnblogs.com/Olive116/p/5149680.html