-- 我们平时使用join关联表习惯使用on，但当两边关联字段名称相同时可以使用using简写，如
select distinct t1.id from xq.test_minus1 t1 join xq.test_minus2 t2 on t1.id = t2.id;
-- 可以简写成
   SELECT DISTINCT 
   id 
FROM xq.test_minus1 t1
   INNER JOIN xq.test_minus2 t2 USING(id);
-- 注意：除了using字段其他同名字段想select需要加表名/表别名且不能单独列出如t1.id, t2,id这会报错
SELECT id FROM xq.test_minus1 a LEFT JOIN xq.test_minus2 b USING(id);
SELECT id FROM xq.test_minus1 a RIGHT JOIN xq.test_minus2 b USING(id);
-- 如果oracle涉及到left join/right join可以这么简写
-- left join
SELECT a.id, b.id FROM xq.test_minus1 a LEFT JOIN xq.test_minus2 b ON a.id = b.id;
SELECT a.id, b.id FROM xq.test_minus1 a, xq.test_minus2 b WHERE a.id = b.id(+);
-- right join
SELECT a.id, b.id FROM xq.test_minus1 a RIGHT JOIN xq.test_minus2 b ON a.id = b.id;
SELECT a.id, b.id FROM xq.test_minus1 a, xq.test_minus2 b WHERE a.id(+) = b.id;

-- using 不能用于不等连接
-- using 连接的字段可以data type 不等，但是名字要相等
-- using 跟natural join是相互排斥的
-- using的字段是不能够再起别名
-- on 连接的字段data type 要一致，名字可以不一样
-- where条件和on条件是分开处理的

-- 一般情况下，on限于where执行，更多参见https://www.jianshu.com/p/73c3088e39fa
-- 自然连接natural join会自动匹配两表的同名字段进行笛卡尔积保留一个同名字段并输出结果
SELECT *
FROM table1
NATURAL JOIN table2;
