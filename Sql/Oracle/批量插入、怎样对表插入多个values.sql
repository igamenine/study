-- oracle无法像mysql一样支持如下语句：
insert into test_trigger(a) values(1), (2);
-- 我们想要实现以上语句，则需要使用INSERT ALL INTO，如下：
insert all
    into test_trigger(a) values(1)
    into test_trigger(a) values(2)
select 1 from dual;
-- 注意：
-- 1、最后一句的返回的结果条数代表批量插入次数，一般只批量插入一次，所以格式不要乱改；
select 1 from dual;
-- 2、不要配合自增序列nextval使用，批量插入会返回一样的序列号，不符合需求，如需插入自增序列，请用传统办法
insert into student values (student_id_seq.nextval,'张三');
insert into student values (student_id_seq.nextval,'李四');

-- 例子：
TRUNCATE TABLE test;
SELECT * FROM test;
insert all
    into test values(student_id_seq.nextval, 1, '自增测试1')
    into test values(student_id_seq.nextval, 2, '自增测试2')
select 1 from dual
UNION ALL
SELECT 2 FROM dual
UNION ALL
SELECT 3 FROM dual;

SELECT * FROM test ORDER BY a;
-- 返回结果：
A	X	C
21	1	自增测试1
21	2	自增测试2
22	2	自增测试2
22	1	自增测试1
23	2	自增测试2
23	1	自增测试1