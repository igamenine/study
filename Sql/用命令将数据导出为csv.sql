--一般情况下可以直接使用Navicat等可视化界面导出，如遇特殊情况则使用以下语句
--mysql
--使用语句导出之前需要设定my.cnf（Windows为my.ini）中添加secure_file_priv = ""开放权限并重启数据库，临时导出开放完毕后可关闭。
--根据实际需求更改导出路径与导出字段
SELECT
	* 
FROM
	wzjj_gsgf3 INTO OUTFILE '/Users/igamenine/Downloads/csv.csv'
						 fields enclosed by '"'
						 TERMINATED by ','
						 ESCAPED by '"'
						 lines terminated by '\r\n';
--带表头
(select 'sz', 'zf100', 'zf500', 'wb', 'fl', 'zf50', 'zf502')
union
(SELECT
	sz, zf100, zf500, wb, fl, zf50, zf502 
FROM
	wzjj_gsgf3 INTO OUTFILE '/Users/igamenine/Downloads/csv.csv'
						 fields enclosed by '"'
						 TERMINATED by ','
						 ESCAPED by '"'
						 lines terminated by '\r\n');

--oracle
直接用plsql导出