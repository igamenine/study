UPDATE 表名 SET  字段= REPLACE(REPLACE(字段, CHAR(10), ''), CHAR(13), ''); 
-- CHAR(10): 换行符
-- CHAR(13): 回车符
