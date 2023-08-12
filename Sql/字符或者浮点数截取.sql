-- mysql&oracle
-- 截取小数点后x位，四舍五入，为0或者没参数则截取整数
ROUND(column, [截取小数点位数])
-- 截取小数点前x位，四舍五入，为0或者没参数则截取整数
round(column, -[截取整数位数])
-- 例子：
select round(122.567, -2) from dual;
select round(162.567, -2) from dual;
-- 结果：
100
200

-- 截断小数点后x位，为0或者没参数则截断整数
trunc(column, [截断小数点位数])
-- 截断小数点前x位，为0或者没参数则截断整数
round(column, -[截断整数位数])
-- 例子：
select trunc(162.567), trunc(162.567, 2), trunc(162.567, -2) from dual;
-- 结果：
162 162.56 100


