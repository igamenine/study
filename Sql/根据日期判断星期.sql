-- mysql
DAYOFWEEK(date) 
-- 返回日期date的星期索引(1=星期天，2=星期一, ……7=星期六)。这些索引值对应于ODBC标准。

WEEKDAY(date) 
-- 返回date的星期索引(0=星期一，1=星期二, ……6= 星期天)。


-- oracle
to_char(date, 'DY')
-- 返回date的星期英文缩写（MON=周一，TUE=周二，WED=周三，THU=周四，FRI=周五，SAT=周六，SUN=周日）