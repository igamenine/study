-- mysql
-- 如果有主键就按照主键排序，如果没主键按照索引。
-- 主键>唯一索引>普通索引
-- 普通索引中按照创建顺序进行优先排序

-- oracle
-- 按照ROWID伪列递增排序，ROWID是按序递增生成的，唯一标识一条记录的物理位置。
-- 生成规则是：
-- AAAR3q AAE AAAACH AAA
-- 数据对象编号+文件编号+块编号+行编号
SELECT ROWID, S.* FROM DEPT S;
-- 在 plsqldev 或其它客户端工具中，一般在 select 后面加 for update ，对检索出的数据进行可视化更新，但其
-- 既然 ROWID 唯一标识一条记录，自然可以用来删除重复数据。
DELETE FROM DEPT_REPEAT S WHERE S.ROWID IN (SELECT MIN(T.ROWID) FROM DEPT_REPEAT T GROUP BY T.DEPTNO, T.DNAME, T.LOC);
