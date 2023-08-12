-- 转自https://www.huaweicloud.com/guide/productsdesc-bms_17361892
-- hive与传统sql标准比兼容的地方，总的来说有2点：
-- 1、对子查询的兼容能力很差，尽量不要嵌套子查询
-- 2、不支持exists查询体
-- 3、hive的默认时区是UTC，如果要获取当前时间需要转成GMT+8时区
-- 除此之外，传统的in、like、regexp都是支持的

-- having不支持子查询
SELECT 
	ps_partkey,
	sum(ps_supplycost * ps_availqty) AS value from  partsupp ps,
	supplier s,
	nation n where  ps_suppkey = s_suppkey
	 AND s_nationkey = n_nationkey
	 AND n_name = 'SAUDI ARABIA'
	 GROUP BY  ps_partkey
 HAVING
	sum(ps_supplycost * ps_availqty) > (
	SELECT 
		sum(ps_supplycost * ps_availqty) * 0.0001000000
	 FROM 
		partsupp ps,
		supplier s,
		nation n
	 WHERE 
		ps_suppkey = s_suppkey
		 AND s_nationkey = n_nationkey
		 AND n_name = 'SAUDI ARABIA' )
	 ORDER BY  value DESC;
-- Error:  Error while compiling statement: FAILED: SemanticException Line 0:-1 Unsupported SubQuery Expression ''SAUDI ARABIA'': Only SubQuery expressions that are top level conjuncts are allowed (state=42000,code=40000)
--不支持多查询结果当成多个字段输出
SELECT 
	c_count,
	count(*) AS custdist from  (
	SELECT 
		c_custkey,
		count(o_orderkey)
	 FROM 
		customer
	LEFT OUTER JOIN orders ON
		c_custkey = o_custkey
		 AND o_comment NOT LIKE '%pending%requests%'
	 GROUP BY 
		c_custkey ) AS c_orders (c_custkey,
	c_count)
	 GROUP BY  c_count order BY  custdist DESC,
	c_count DESC;
-- Error:  Error while compiling statement: FAILED: ParseException line 1:213 missing EOF at '(' near 'c_orders' (state=42000,code=40000)
--不支持把查询的结果当成字段比较
SELECT 
	sum(l_extendedprice) / 7.0 AS avg_yearly from  lineitem,
	part where  p_partkey = l_partkey
	 AND p_br and = 'Brand#25'
	 AND p_container = 'MED JAR'
	 AND l_quantity < (
	SELECT 
		0.2 * avg(l_quantity)
	 FROM 
		lineitem
	 WHERE 
		l_partkey = p_partkey );
-- Error:  Error while compiling statement: FAILED: SemanticException [ Error 10249]: Line 14:4 Unsupported SubQuery Expression 'ps_suppkey': Correlating expression contains ambiguous column references. (state=42000,code=10249)

--多表关联不支持not in和in在子查询中过滤
SELECT 
	c_name,
	c_custkey,
	o_orderkey,
	o_orderdate,
	o_totalprice,
	sum(l_quantity)
	 FROM  customer,
	orders,
	lineitem where  o_orderkey IN (
	SELECT 
		l_orderkey
	 FROM 
		lineitem
	 GROUP BY 
		l_orderkey
	 HAVING
		sum(l_quantity) > 315 )
	 AND c_custkey = o_custkey
	 AND o_orderkey = l_orderkey group BY  c_name,
	c_custkey,
	o_orderkey,
	o_orderdate,
	o_totalprice order BY  o_totalprice DESC,
	o_orderdate limit 100;
-- Error:  Error while compiling statement: FAILED: SemanticException [ Error 10249]: Line 13:0 Unsupported SubQuery Expression 'o_orderkey': Correlating expression contains ambiguous column references. (state=42000,code=10249)

--不支持多层级in嵌套子查询
SELECT 
	i_item_id item_id,
	sum(sr_return_quantity) sr_item_qty
 FROM 
	store_returns,
	item,
	date_dim
 WHERE 
	sr_item_sk = i_item_sk
	 AND d_date IN (
	SELECT 
		d_date
	 FROM 
		date_dim
	 WHERE 
		d_week_seq IN (
		SELECT 
			d_week_seq
		 FROM 
			date_dim
		 WHERE 
			d_date IN ('1998-01-02', '1998-10-15', '1998-11-10')))
	 AND sr_returned_date_sk = d_date_sk
 GROUP BY 
	i_item_id),
	cr_items AS (
	SELECT 
		i_item_id item_id,
		sum(cr_return_quantity) cr_item_qty
	 FROM 
		catalog_returns,
		item,
		date_dim
	 WHERE 
		cr_item_sk = i_item_sk);
--Unsupported SubQuery Expression 'd_week_seq': SubQuery cannot use the table alias: date_dim; this is also an alias in the Outer Query  and SubQuery contains a unqualified column reference (state=42000,code=10249)

--关联条件中不支持多个exists查询体
SELECT 
	s_name,
	count(*) AS numwait from  supplier,
	lineitem l1,
	orders,
	nation where  s_suppkey = l1.l_suppkey
	 AND o_orderkey = l1.l_orderkey
	 AND o_orderstatus = 'F'
	 AND l1.l_receiptdate > l1.l_commitdate
	 AND EXISTS (
	SELECT 
		*
	 FROM 
		lineitem l2
	 WHERE 
		l2.l_orderkey = l1.l_orderkey
		 AND l2.l_suppkey <> l1.l_suppkey )
	 AND NOT EXISTS (
	SELECT 
		*
	 FROM 
		lineitem l3
	 WHERE 
		l3.l_orderkey = l1.l_orderkey
		 AND l3.l_suppkey <> l1.l_suppkey
		 AND l3.l_receiptdate > l3.l_commitdate )
	 AND s_nationkey = n_nationkey
	 AND n_name = 'VIETNAM'
	 GROUP BY  s_name order BY  numwait DESC,
	s_name limit 100;
-- Error:  Error while compiling statement: FAILED: SemanticException [ Error 10249]: Line 23:8 Unsupported SubQuery Expression 'l_commitdate': Only 1 SubQuery expression is supported. (state=42000,code=10249)

--不支持exsits查询体关联
SELECT 
	o_orderpriority,
	count(*) AS order_count from  orders where  o_orderdate >= date '1996-09-01'
	 AND o_orderdate < date '1996-09-01' + INTERVAL '3' MONTH
	 AND EXISTS (
	SELECT 
		*
	 FROM 
		lineitem
	 WHERE 
		l_orderkey = o_orderkey
		 AND l_commitdate < l_receiptdate )
	 GROUP BY  o_orderpriority order BY  o_orderpriority;
-- Error:  Error while compiling statement: FAILED: SemanticException [ Error 10250]: Line 1:181 Invalid SubQuery expression 'l_receiptdate': For Exists/Not Exists operator SubQuery must be Correlated. (state=42000,code=10250)
