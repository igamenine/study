-- 在flinksql中，如果要对整数进行除法，需要转换被除数的数据类型，否则结果会被截断成整数，当结果小于1则是0
-- 下方例子是统计饱和度的sql语句
select
round(count(case when a is not null and length(a) > 0 then a end) / cast(count(1) as decimal) * 100, 2) as a
from table;

-- flinksql中order by 支持使用字段别名，但是group by 不支持
select a as b, count(1) as cnt from table1 group by a order by cnt desc;
-- 如果在order by中使用字段别名的话，需要注意不能和原来的字段重名，如下面这条语句会报错
select a, sum(b) as b from table1 group by a order by sum(b);
select a, sum(b) as b from table1 group by a order by b;

-- 计算日期差，单位为天
select datediff(enddate, startdate)
-- 记住：第一个参数为被减数，第二个参数为减数，即左减右

-- 在mysql中，group by和order by 是可以使用select中定义的字段别名代称复杂的字段公式的，flink和hive中只允许order by使用别名
-- mysql特殊是因为mysql中对查询做了加强。其余像oracle、hive中别名的使用都是严格遵循sql执行顺序的。
-- hive/flink语句执行顺序
-- (7)    SELECT
-- (8)    DISTINCT <select_list>
-- (1)    FROM <left_table>
-- (3)    <join_type> JOIN <right_table>
-- (2)    ON <join_condition>
-- (4)    WHERE <where_condition>
-- (5)    GROUP BY <group_by_list>
-- (6)    HAVING <having_condition>
-- (9)    ORDER BY <order_by_condition>
-- (10)   LIMIT <limit_number> 
-- 从上述sql的执行顺序可以看出，Group by之所以不能使用字段别名，是因为当执行到第五步GROUP BY时，第七步的SELECT还没有执行。由于ORDER BY在SELECT后面，所以可以使用字段别名。

-- 另外，FROM语句是第一步执行的，故所有的关键字都可以使用表别名，这个一定要注意。