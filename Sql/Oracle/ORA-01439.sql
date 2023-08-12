-- ORA-01439:要更改数据类型,则要修改的列必须为空
/*修改原字段名name为name_tmp*/
alter table tb rename column name to name_tmp;
/*增加一个和原字段名同名的字段name*/
alter table tb add name varchar2(40);
/*将原字段name_tmp数据更新到增加的字段name*/
update tb set name=trim(name_tmp);
/*更新完，删除原字段name_tmp*/
alter table tb drop column name_tmp;

-- 总结：
-- 1、当字段没有数据或者要修改的新类型和原类型兼容时，可以直接modify修改。
-- 2、当字段有数据并用要修改的新类型和原类型不兼容时，要间接新建字段来转移。
-- 转自https://blog.csdn.net/ouyangwanshan/article/details/47954113