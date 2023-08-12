
-- trigger_name：标识触发器名称，用户自行指定；
-- trigger_time：标识触发时机，取值为 BEFORE 或 AFTER；
-- trigger_event：标识触发事件，取值为 INSERT、UPDATE 或 DELETE；
-- tbl_name：标识建立触发器的表名，即在哪张表上建立触发器；
-- for each row：固定语句
-- trigger_stmt：触发器程序体，可以是一句SQL语句，或者用 BEGIN 和 END 包含的多条语句。
-- 注意：mysql的触发器无法自己更新自己，比如说你要监控表a，那么该触发器无法对表a进行操作
CREATE TRIGGER trigger_name
trigger_time
trigger_event ON tbl_name
FOR EACH ROW
trigger_stmt

-- mysql
create table test_trigger(a int, b varchar(10));
create table test_trigger2(a int, x varchar(10));
create table trigger_temp(a varchar(20));

CREATE TRIGGER trigger_test
before
insert ON test_trigger
FOR EACH ROW
insert into test_trigger2 values(new.a, '执行插入操作');

CREATE TRIGGER trigger_test2
after
insert ON test_trigger
FOR EACH ROW
BEGIN
	insert into trigger_temp values(concat('begin...end测试成功,值为', new.a));
end

CREATE TRIGGER trigger_test3
after
insert ON test_trigger
FOR EACH ROW
BEGIN
    declare new_a int;
	declare new_b varchar(20);
    set new_a = new.a;
    set new_b = concat('字符串初始化', new.a);
    update test_trigger2 set x = new_b where a = new_a;
end

-- oracle

create table xq.test_trigger(a int, b varchar(50));
create table xq.test_trigger2(a int, x varchar(50));
create table xq.trigger_temp(a varchar(100));

CREATE OR REPLACE TRIGGER xq.trigger_test
before
insert ON xq.test_trigger
FOR EACH ROW
BEGIN
insert into xq.test_trigger2 values(:new.a, '执行插入操作');
END;

CREATE OR REPLACE TRIGGER xq.trigger_test2
after
insert ON xq.test_trigger
FOR EACH ROW
BEGIN
	insert into xq.trigger_temp values(concat('begin...end测试成功,值为', :new.a));
END;

DROP trigger xq.trigger_test3;

insert all
    into xq.test_trigger(a) values(1)
    into xq.test_trigger(a) values(2)
select 1 from dual;
select * from xq.test_trigger ;
select * from xq.test_trigger2 ;
select * from xq.trigger_temp ;

-- insert into test_trigger(a) values(1), (2);
-- select * from test_trigger tt ;
-- select * from test_trigger2 tt ;
-- select * from trigger_temp tt ;

-- Sqlserver
-- 转自https://www.cnblogs.com/Alpha-Fly/archive/2012/04/09/2438419.html
-- 常见的触发器有两种：after(for)、instead of,用于insert、update、delete事件。
-- after(for)        表示执行代码后，执行触发器
-- instead of        表示执行代码前，用已经写好的触发器代替你的操作
-- create trigger 触发器的名字   on 操作表
-- for/after/instead of
-- update/insert/delete
-- as
-- SQL语句

--禁止用户插入数据(实际上是先插入，然后立刻将其删除！)
create trigger tr_insert on bank
for insert
as
    delete from bank where cid = (select cid from inserted);

--删除谁就让谁的账户加上10元
create trigger tr_insert on bank
insted of delete
as
    update bank balance = balance + 10 where cid = (select cid from deleted);

