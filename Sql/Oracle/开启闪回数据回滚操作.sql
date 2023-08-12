-- 回滚操作之前需要对数据开启闪回功能声明
-- 如果相隔时间过长的话，数据就回滚不了了，所以一旦数据出现问题，就要立即进行处理。
alter table xq.test_syh enable row movement;
-- 关闭闪回声明
alter table 表名 disable row movement;

-- 回滚插入操作
SELECT * FROM xq.test_syh;
SELECT sysdate FROM dual;
INSERT INTO xq.test_syh values(2022);
select * from xq.test_syh;
select * from xq.test_syh  as of timestamp to_timestamp('2022-07-07 11:06:00', 'yyyy-mm-dd hh24:mi:ss');
flashback table xq.test_syh to timestamp TO_TIMESTAMP('2022-07-07 11:06:42', 'yyyy-mm-dd hh24:mi:ss');
select * from xq.test_syh;

-- 回滚删除操作
select * from xq.test_syh;
DROP TABLE xq.test_syh;
FLASHBACK TABLE xq.test_syh TO BEFORE DROP;
select * from xq.test_syh;

-- 回滚delete和update操作
MERGE INTO 表名 a
USING (SELECT *
         FROM 表名 AS OF TIMESTAMP to_timestamp('2019-04-16 21:43:38', 'yyyy-mm-dd hh24:mi:ss')
       MINUS
       SELECT *
         FROM 表名) b
ON (a.id = b.id)
WHEN MATCHED THEN
  UPDATE
     SET a.col = b.col,
WHEN NOT MATCHED THEN
  INSERT
  VALUES
    (b.id,
     b.col);

-- 回滚insert数据
DELETE FROM 表名 a
WHERE EXISTS (SELECT 1
          FROM (SELECT *
                  FROM 表名
                MINUS
                SELECT *
                  FROM 表名 AS OF TIMESTAMP to_timestamp('2019-04-16 21:45:38', 'yyyy-mm-dd hh24:mi:ss')) b
         WHERE a.id = b.id);

-- 转自https://blog.csdn.net/w8827130/article/details/89303087