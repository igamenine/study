-- mysql
-- interval参数分别为micosecond, second, minute, day, week, month, quarter, year
TIMESTAMPDIFF(interval,datetime_expr1,datetime_expr2) 
-- 返回日期或日期时间表达式datetime_expr1 和datetime_expr2the 之间的整数差。
-- 其结果的单位由interval 参数给出。interval 的法定值同TIMESTAMPADD()函数说明中所列出的相同。 


-- Oracle
-- 天
datetime_expr2 - datetime_expr1
-- 小时
(datetime_expr2 - datetime_expr1)*24
-- 分钟
(datetime_expr2 - datetime_expr1)*24*60
-- 秒
(datetime_expr2 - datetime_expr1)*24*60*60
-- 毫秒
(datetime_expr2 - datetime_expr1)*24*60*60*1000
