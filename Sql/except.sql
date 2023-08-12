-- except是union的反义词，它会把表1中含表2的数据排除掉
-- except和union一样会对结果进行去重，except all不会
-- mysql不支持except
SELECT column1 [, column2 ]
FROM table1 [, table2 ]
[WHERE condition]

EXCEPT

SELECT column1 [, column2 ]
FROM table1 [, table2 ]
[WHERE condition]

