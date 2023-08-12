-- Oracle rownum 虚拟序号的应用
-- rownum
-- 返回数据默认顺序下的增量序号
SELECT rownum, a1 FROM xq.a8 ORDER BY rownum; -- rownum默认自增
SELECT rownum, a1 FROM xq.a8 ORDER BY a1 ; -- rownum不会自增，是乱的
SELECT rownum, a1 FROM xq.a8; -- rownum默认自增

-- row_number() over( order by 字段名1[,字段名2,...字段名n] )
-- 先排序再返回增量序号
SELECT row_number() over( order by a1) as "rownum", a1 FROM xq.a8;  -- 根据a1升序后生成序号
SELECT row_number() over( order by a1 desc) as "rownum", a1 FROM xq.a8;  -- 根据a1降序后生成序号

-- row_number() over(PARTITION BY 分区字段1[,分区字段2,...分区字段n] order by 字段名1[,字段名2,...字段名n] )
-- 先分区再返回增量序号，序号只在分区内自增，跨区初始化重新自增，顺序排序，重复值正常自增
select row_number() over(PARTITION BY createdate order by a1 ) as "rownum", a1, createdate from xq.a8;

-- rank() over(PARTITION BY 分区字段1[,分区字段2,...分区字段n] order by 字段名1[,字段名2,...字段名n] )
-- 先分区再返回增量序号，序号只在分区内自增，跨区初始化重新自增，跳跃排序，重复值序号不变，下一个+2如1,2,2,4
select rank() over(PARTITION BY createdate order by a1 ) as "rownum", a1, createdate from xq.a8;

-- dense_rank() over(PARTITION BY 分区字段1[,分区字段2,...分区字段n] order by 字段名1[,字段名2,...字段名n] )
-- 先分区再返回增量序号，序号只在分区内自增，跨区初始化重新自增，连续排序，重复值序号不变，下一个+1如1,2,2,3
select dense_rank() over(PARTITION BY createdate order by a1 ) as "rownum", a1, createdate from xq.a8;

-- 如果发现空值排在最前面，那么在order by 字段 后面加上nulls last
-- 转自https://www.cnblogs.com/qiuting/p/7880500.html

-- hive也有相同语句