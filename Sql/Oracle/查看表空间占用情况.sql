SELECT
	a.tablespace_name,
	a.bytes / 1024 / 1024 total,
	b.bytes / 1024 / 1024 used,
	c.bytes / 1024 / 1024 FREE,
	(b.bytes * 100) / a.bytes "% USED ",
	(c.bytes * 100) / a.bytes "% FREE "
FROM
	sys.sm$ts_avail a,
	sys.sm$ts_used b,
	sys.sm$ts_free c
WHERE
	a.tablespace_name = b.tablespace_name
	AND a.tablespace_name = c.tablespace_name
	AND a.tablespace_name = 'SYSTEM';

SELECT
	OWNER,
	SEGMENT_NAME,
	SEGMENT_TYPE,
	SUM(BYTES)/ 1024 / 1024 AS used
FROM
	DBA_SEGMENTS
WHERE
	TABLESPACE_NAME = 'SYSTEM'
GROUP BY
	OWNER,
	SEGMENT_NAME,
	SEGMENT_TYPE
ORDER BY
	used DESC;

-- 如果Oracle有开启审计日志那可能影响表空间导致数据库异常,需要查询AUD$表的空间占用并清理
SELECT
	bytes / 1024 / 1024
FROM
	dba_segments
WHERE
	segment_name = 'AUD$';

    truncate table sys.AUD$;

-- 关闭日志审计功能(需重启数据库)
alter system set audit_trail=none scope=spfile;