Select to_char(sysdate,'Q') from dual;--指定日期的季度

Select to_char(sysdate,'MM') from dual;--月份

Select to_char(sysdate,'WW') from dual;--当年第几周

Select to_char(sysdate,'W') from dual ;--本月第几周

Select to_char(sysdate,'DD') from dual;--当月第几天

Select to_char(sysdate,'D') from dual;--周内第几天

Select to_char(sysdate,'DY') from duaL;--星期几

Select last_day(sysdate) from dual;--本月最后一天

Select add_months(sysdate,2) from dual;--当前日期d后推n个月

select months_between(sysdate,to_date('2012-11-12','yyyy-mm-dd'))from dual;--日期f和s间相差月数

SELECT next_day(sysdate,'mon') FROM dual;--指定的日期之后的第一个工作日的日期
SELECT next_day(sysdate,2) FROM dual;--指定的日期之后的第一个工作日的日期

select to_char(add_months(last_day(sysdate),-1),'yyyy-MM-dd') LastDay from dual;--上月末天

select to_char(add_months(sysdate,-1),'yyyy-MM-dd') PreToday from dual;--上月今天

select to_char(add_months(last_day(sysdate)+1,-2),'yyyy-MM-dd') firstDay from dual;--上月第一天

select to_char(sysdate,'ww') from dual group by to_char(sysdate,'ww');--按照每周进行统计

select to_char(sysdate,'mm') from dual group by to_char(sysdate,'mm');--按照每月进行统计

select to_char(sysdate,'q') from dual group by to_char(sysdate,'q');--按照每季度进行统计

-- 今日
select * from 表名 where to_char(字段名,'dd')=to_char(sysdate,'dd')
-- 昨日
select * from  表名 where to_char(字段名,'dd')= to_char(sysdate-1,'dd')
-- 本周 
 select * from 表名 where to_char(字段名,'iw')=to_char(sysdate,'iw') 
-- 本月 
 select * from 表名 where to_char(字段名,'mm')=to_char(sysdate,'mm') 
-- 本季度 
 select * from 表名 where to_char(字段名,'q')=to_char(sysdate,'q')

-- 加法

select sysdate,add_months(sysdate,12) from dual;        --加1年

select sysdate,add_months(sysdate,1) from dual;        --加1月

select sysdate,to_char(sysdate+7,'yyyy-mm-dd HH24:MI:SS') from dual;   --加1星期/7天

select sysdate,to_char(sysdate+1,'yyyy-mm-dd HH24:MI:SS') from dual;   --加1天

select sysdate,to_char(sysdate+1/24,'yyyy-mm-dd HH24:MI:SS') from dual;  --加1小时

select sysdate,to_char(sysdate+1/24/60,'yyyy-mm-dd HH24:MI:SS') from dual;  --加1分钟

select sysdate,to_char(sysdate+1/24/60/60,'yyyy-mm-dd HH24:MI:SS') from dual;  --加1秒

-- 减法

select sysdate,add_months(sysdate,-12) from dual;        --减1年

select sysdate,add_months(sysdate,-1) from dual;        --减1月

select sysdate,to_char(sysdate-7,'yyyy-mm-dd HH24:MI:SS') from dual;   --减1星期/7天

select sysdate,to_char(sysdate-1,'yyyy-mm-dd HH24:MI:SS') from dual;   --减1天

select sysdate,to_char(sysdate-1/24,'yyyy-mm-dd HH24:MI:SS') from dual;  --减1小时

select sysdate,to_char(sysdate-1/24/60,'yyyy-mm-dd HH24:MI:SS') from dual;  --减1分钟

select sysdate,to_char(sysdate-1/24/60/60,'yyyy-mm-dd HH24:MI:SS') from dual;  --减1秒