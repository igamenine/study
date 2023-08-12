-- 定义
-- NEXT_DAY(date,char)
-- date参数为日期型，
-- char:为1~7或Monday/Mon~Sunday/

-- 格式：NEXT_DAY(DATE,WEEKDAY) 即 NEXT_DAY(日期,星期几)

-- 用法：查询出指定时间的下一个星期几（由char指定）所在的日期， char也可用1～7替代，1表示星期日，2代表星期一。 char 还可以是星期一、星期二......星期日。即 monday,thusday.....(看是什么字符集的)。

SELECT next_day(sysdate,'mon') FROM dual;--指定的日期之后的第一个工作日的日期
SELECT next_day(sysdate,2) FROM dual;--指定的日期之后的第一个工作日的日期