-- 结论：如果被比较的表数据量比主表大，那就使用exists，否则使用in。

select * from A
where id in(select id from B)

以上查询使用了in语句,in()只执行一次,它查出B表中的所有id字段并缓存起来.之后,检查A表的id是否与B表中的id相等,如果相等则将A表的记录加入结果集中,直到遍历完A表的所有记录.
当B表数据较大时不适合使用in(),因为它会B表数据全部遍历一次.
如:A表有10000条记录,B表有1000000条记录,那么最多有可能遍历10000*1000000次,效率很差.
再如:A表有10000条记录,B表有100条记录,那么最多有可能遍历10000*100次,遍历次数大大减少,效率大大提升.

结论:in()适合B表比A表数据小的情况

select a.* from A a 
where exists(select 1 from B b where a.id=b.id)

以上查询使用了exists语句,exists()会执行A.length次,它并不缓存exists()结果集,因为exists()结果集的内容并不重要,重要的是结果集中是否有记录,如果有则返回true,没有则返回false.
当B表比A表数据大时适合使用exists(),因为它没有那么遍历操作,只需要再执行一次查询就行.
如:A表有10000条记录,B表有1000000条记录,那么exists()会执行10000次去判断A表中的id是否与B表中的id相等.
如:A表有10000条记录,B表有100000000条记录,那么exists()还是执行10000次,因为它只执行A.length次,可见B表数据越多,越适合exists()发挥效果.
再如:A表有10000条记录,B表有100条记录,那么exists()还是执行10000次,还不如使用in()遍历10000*100次,因为in()是在内存里遍历比较,而exists()需要查询数据库,我们都知道查询数据库所消耗的性能更高,而内存比较很快.

结论:exists()适合B表比A表数据大的情况

当A表数据与B表数据一样大时,in与exists效率差不多,可任选一个使用.
在Northwind数据库中有一个查询为
SELECT c.CustomerId,CompanyName FROM Customers c
WHERE EXISTS(
SELECT OrderID FROM Orders o WHERE o.CustomerID=c.CustomerID) 
这里面的EXISTS是如何运作呢？子查询返回的是OrderId字段，可是外面的查询要找的是CustomerID和CompanyName字段，这两个字段肯定不在OrderID里面啊，这是如何匹配的呢？ 

EXISTS用于检查子查询是否至少会返回一行数据，该子查询实际上并不返回任何数据，而是返回值True或False
EXISTS 指定一个子查询，检测 行 的存在。

语法： EXISTS subquery
参数： subquery 是一个受限的 SELECT 语句 (不允许有 COMPUTE 子句和 INTO 关键字)。
结果类型： Boolean 如果子查询包含行，则返回 TRUE ，否则返回 FLASE 。

注意：EXISTS使用的子查询中字段在没有声明表名的情况下默认使用子查询的表，所以新手会经常查询不到正确结果，我们只需要对被筛选表进行表名声明即可，如
select * from dlsite_temp_20230528 a
where not EXISTS (select * from dlsite b where a.rj_id = rj_id);
