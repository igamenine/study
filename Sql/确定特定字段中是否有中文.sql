-- mysql
-- 返回有中文的结果，如果结果为空则没有中文
SELECT col FROM table WHERE length(col)!=char_length(col);

-- oracle
-- 返回有中文的结果，如果结果为空则没有中文
SELECT a FROM TEST WHERE ASCIISTR(a) LIKE '%\%' ;