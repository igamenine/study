
简单索引：create index BOOK_INFO_INDEX_1 on BOOK_INFO(ISBN);

复合索引：create index BOOK_INFO_INDEX_1 on BOOK_INFO(COLUMN1,COLUMN2,COLUMN3)；

复合索引使用需要注意的是，只有当column1字段作为查询条件之一时，该索引才会有效。与三者之间的顺序没有关系。

当然，并不是建立索引后，每次查询都会生效，一般情况下，只有当查询结果小于总数量的10%左右时，索引才会有效，否则是全表扫描。

2.重置索引

alter index rebuild;

3.删除索引

drop index ;

4.强制使用索引

select /+INDEX(t )/ t.* from where t.column_name='';

如：

select /*+INDEX(t BOOK_INFO_INDEX_1 )*/ t.* from BOOK_INFO t where t.ISBN='201902';

5.通过查看sql执行计划，了解sql语句是否启用索引

方法一：在plsql中新建Command窗口，按下面的步骤执行

a.生成执行计划

explain plan for select * from BOOK_INFO where ISBN='123456'；

备注：explain plan for后面为要生成执行计划的查询语句

b.查看执行计划结果

select * from table(dbms_xplan.display);

c.查看索引是否使用

index range scan为索引范围扫描，TABLE ACCESS FULL为全表扫描

方法二：在plsql中新建SQL窗口，在窗口中写入查询语句，然后按F5即可；

6.查看表索引信息

select * from user_indexes where table_name='BOOK_INFO' ;

select * from user_ind_columns where table_name ='BOOK_INFO' ;

7.查看表索引是否启用

--a、开启索引监控 alter index monitoring usage;

alter index BOOK_INFO_INDEX_1 monitoring usage;

--b、查看

select * from v$object_usage;

--c、关闭 alter index nomonitoring usage;

alter index BOOK_INFO_INDEX_1 nomonitoring usage;