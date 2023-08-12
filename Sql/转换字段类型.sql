-- mysql
1、CAST(value as type) 就是CAST(xxx AS 类型)
2、CONVERT(value, type) 就是CONVERT(xxx,类型)
-- 要特别注意,可以转换的数据类型是有限制的。这个类型可以是以下值其中的一个：
-- 二进制，同带binary前缀的效果 : BINARY
-- 字符型，可带参数 : CHAR()
-- 日期 : DATE
-- 时间: TIME
-- 日期时间型 : DATETIME
-- 浮点数 : DECIMAL
-- 整数 : SIGNED
-- 无符号整数 : UNSIGNED
cast(column as unsigned)
convert(column, unsigned)

-- oracle
-- 将数字或者日期转换成文本
to_char(column)
to_char(column, 'yyyy-mm-dd hh24:mi:ss')
-- 将文本转换为日期
to_date(column, 'yyyy-mm-dd hh24:mi:ss')
-- 将文本转换为整数
to_number(column)