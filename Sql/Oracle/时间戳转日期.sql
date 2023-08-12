-- 时间戳的本质就是毫秒，时间戳的最小值是0000000000000，对应1970-01-01 08:00:00，在此基础上往后推日期。
-- 毫秒转换为日期
SELECT TO_CHAR(1406538765000 / (1000 * 60 * 60 * 24) + TO_DATE('1970-01-01 08:00:00', 'yyyy-MM-dd HH24:mi:ss'), 'yyyy-MM-dd HH24:mi:ss') AS CDATE FROM DUAL;

-- 日期转换毫秒
SELECT TO_NUMBER(TO_DATE('2014-07-28 17:12:45', 'yyyy-MM-dd HH24:mi:ss') - TO_DATE('1970-01-01 08:00:00', 'yyyy-MM-dd HH24:mi:ss')) * 24 * 60 * 60 * 1000 FROM DUAL;