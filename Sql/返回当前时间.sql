-- mysql
select now();
select sysdate();

-- oracle
select sysdate from dual;

-- hive
-- 注意，hive的默认时区是UTC，需要设置成GMT+8时区
select current_timestamp();
-- 使用第三方数据中台执行hive语句时/数据源为UTC时
SELECT from_utc_timestamp(CURRENT_TIMESTAMP,'GMT+8');