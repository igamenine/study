-- 局部变量是存储过程、存储函数中使用的变量，需要提前声明，且只能在begin...end代码块中使用，而用户变量是可以单独set的变量，不需要声明直接使用，系统会自动匹配变量类型。

-- 局部变量
-- mysql
delimiter $$
create procedure procedure_test(in p_id int, in p_sex char(1))
begin
  declare p_name varchar(4) default '张三';
  update student set sex = p_sex where id = p_id;
end
delimiter ;

-- 用户变量
-- mysql
set @p_name = '张三';
select id, sex from student where name = @p_name;