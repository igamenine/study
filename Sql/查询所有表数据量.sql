--查看Rows列，如需总和复制出来相加即可
--mysql
show table status;
--基于mysql的分布式数据库（如scsdb）
show table status with total;

--查看Rows列，如需总和则使用sum函数
--Oracle
SELECT
	TABLE_NAME,
	NVL( NUM_ROWS, 0 ) "ROWS" 
FROM
	user_tables 
WHERE
	tablespace_name = 'SYSTEM' 
ORDER BY
	"ROWS" DESC;