-- 常用的join有默认的join(inner join)、left join、right join，除了这几个之外的join几乎不用到，了解即可：

-- natural join 自然连接：自动匹配两张表中的相同字段名并内连接，关联字段合并为1个
select id from igamenine.test_minus1 tm natural join igamenine.test_minus2 tm2 ;
-- 注意：输出字段不再需要添加表名（如t1.id），否则Oracle中会报ORA-25155错误

-- full join 全连接：左连接和右连接的组合。完整的外部连接包括联接表中的所有行，无论另一个表是否具有匹配的行。
select * from xq.test_minus1 tm full join xq.test_minus2 tm2 on tm.id = tm2.id ;
-- 注意：mysql不支持full join，需要通过以下语句实现
SELECT * FROM emp e LEFT JOIN dept d ON d.deptno = e.deptno UNION SELECT * FROM emp e RIGHT JOIN dept d ON d.deptno = e.deptno;
SELECT * FROM emp e LEFT JOIN dept d ON d.deptno = e.deptno UNION ALL SELECT * FROM emp e RIGHT JOIN dept d ON d.deptno = e.deptno WHERE e.deptno IS NULL;