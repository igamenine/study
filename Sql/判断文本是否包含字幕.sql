-- mysql
-- 不区分大小写,如果数据库实际区分则写成[a-zA-Z]
SELECT '1AA' REGEXP '[a-z]';
-- 区分大小写（会与字符集为utf8mb4_0900_ai_ci的数据库起冲突）
SELECT '1AA' REGEXP BINARY '[a-z]';



--oracle
select column from tablename where regexp_like(column, '[a-zA-Z]');