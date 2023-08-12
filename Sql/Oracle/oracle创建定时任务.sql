-- 创建job
-- 在plsql中执行包统一加上begin end，sqlplus中使用exec
declare
  job number;
BEGIN
  DBMS_JOB.SUBMIT(  
        JOB => job,  /*自动生成JOB_ID*/  
        WHAT => 'proc_add_test;',  /*需要执行的存储过程名称或SQL语句*/  
        NEXT_DATE => sysdate+3/(24*60),  /*初次执行时间-下一个3分钟*/  
        INTERVAL => 'trunc(sysdate,''mi'')+1/(24*60)' /*每隔1分钟执行一次*/
      );  
  commit;
end;

-- 查询job
select * from user_jobs;

-- 手动调用job
 begin
   DBMS_JOB.RUN(40); /*40 job的id*/
 end;

--  删除job
begin
  /*删除自动执行的job*/
  dbms_job.remove(40);
end;

-- 修改INTERVAL时间
dbms_job.interval(job，interval);

-- 修改NEXT_DATE时间
dbms_job.next_date(job，next_date);

-- 修改WHAT操作
dbms_job.what(jobno，'sp_fact_charge_code;');

-- 停止job
-- plsql
dbms_job.broken(job,true/false);
dbms_job.broken(23,true);

-- INTERVAL参数常用值示例
-- 每天午夜12点            ''TRUNC(SYSDATE + 1)''     
-- 每天早上8点30分         ''TRUNC(SYSDATE + 1) + （8*60+30）/(24*60)''     
-- 每星期二中午12点         ''NEXT_DAY(TRUNC(SYSDATE ), ''''TUESDAY'''' ) + 12/24''     
-- 每个月第一天的午夜12点    ''TRUNC(LAST_DAY(SYSDATE ) + 1)''     
-- 每个季度最后一天的晚上11点 ''TRUNC(ADD_MONTHS(SYSDATE + 2/24, 3 ), ''Q'' ) -1/24''     
-- 每星期六和日早上6点10分    ''TRUNC(LEAST(NEXT_DAY(SYSDATE, ''''SATURDAY"), NEXT_DAY(SYSDATE, "SUNDAY"))) + （6×60+10）/（24×60）''    
-- 每3秒钟执行一次             'sysdate+3/(24*60*60)'   
-- 每2分钟执行一次           'sysdate+2/(24*60)'   
  
-- 1:每分钟执行  
-- Interval => TRUNC(sysdate,'mi') + 1/ (24*60) --每分钟执行  
-- interval => 'sysdate+1/（24*60）'  --每分钟执行  
-- interval => 'sysdate+1'    --每天  
-- interval => 'sysdate+1/24'   --每小时  
-- interval => 'sysdate+2/24*60' --每2分钟  
-- interval => 'sysdate+30/24*60*60'  --每30秒  
-- 2:每天定时执行  
-- Interval => TRUNC(sysdate+1)  --每天凌晨0点执行  
-- Interval => TRUNC(sysdate+1)+1/24  --每天凌晨1点执行  
-- Interval => TRUNC(SYSDATE+1)+(8*60+30)/(24*60)  --每天早上8点30分执行  
-- 3:每周定时执行  
-- Interval => TRUNC(next_day(sysdate,'星期一'))+1/24  --每周一凌晨1点执行  
-- Interval => TRUNC(next_day(sysdate,1))+2/24  --每周一凌晨2点执行  
-- 4:每月定时执行  
-- Interval =>TTRUNC(LAST_DAY(SYSDATE)+1)  --每月1日凌晨0点执行  
-- Interval =>TRUNC(LAST_DAY(SYSDATE))+1+1/24  --每月1日凌晨1点执行  
-- 5:每季度定时执行  
-- Interval => TRUNC(ADD_MONTHS(SYSDATE,3),'q')  --每季度的第一天凌晨0点执行  
-- Interval => TRUNC(ADD_MONTHS(SYSDATE,3),'q') + 1/24  --每季度的第一天凌晨1点执行  
-- Interval => TRUNC(ADD_MONTHS(SYSDATE+ 2/24,3),'q')-1/24  --每季度的最后一天的晚上11点执行  
-- 6:每半年定时执行  
-- Interval => ADD_MONTHS(trunc(sysdate,'yyyy'),6)+1/24  --每年7月1日和1月1日凌晨1点  
-- 7:每年定时执行  
-- Interval =>ADD_MONTHS(trunc(sysdate,'yyyy'),12)+1/24  --每年1月1日凌晨1点执行  
-- 转自https://www.cnblogs.com/bill89/p/11044928.html