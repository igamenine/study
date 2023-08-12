-- 方法一
create sequence student_id_seq;  --创建序列
insert into student values (student_id_seq.nextval,'张三');
insert into student values (student_id_seq.nextval,'李四');
select * from student;  --查询表
-- 使用Oralcle11g查询表的时候，可能会发现自增的字段初始值不为1，因为从Oracle 11g开始，有一种新特性叫“延迟分配段空间”
-- 转自https://blog.csdn.net/qq_40774525/article/details/80160403

-- 方法二
-- 利用触发器自动填充序列号，我感觉脱裤子放屁，但确实可以减少用户书写，因人而异
create or replace trigger test_id
before insert on test  --before:执行DML等操作之前触发
for each row  --行级触发器
begin 
	select student_id_seq.nextval into :new.a from dual;
end;

 TRUNCATE TABLE test;
insert into test(c) values ('张三');
insert into test (c) values ('李四');
select * from test;