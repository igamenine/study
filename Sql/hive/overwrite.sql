insert into或insert overwrite操作可以将select查询的结果保存至目标表中。二者的区别是：
insert into：直接向表或静态分区中插入数据。您可以在insert语句中直接指定分区值，将数据插入指定的分区。如果您需要插入少量测试数据，可以配合VALUES使用。
insert overwrite：先清空表中的原有数据，再向表或静态分区中插入数据。

使用限制
执行insert into和insert overwrite操作更新表或静态分区数据的使用限制如下：
insert into：不支持向聚簇表中追加数据。
insert overwrite：不支持指定插入列，只能使用insert into。例如create table t(a string, b string); insert into t(a) values ('1');，a列插入1，b列为NULL或默认值。

MaxCompute对正在操作的表没有锁机制，不要同时对一个表执行insert into或insert overwrite操作。