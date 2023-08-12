-- 1、	查询物理文件分别绑定了哪些表空间
Select * from file_name;
-- 2、	查询该表空间下的表实际占用大小
Select * from dba_segments where tablespace_name=[步骤1查询到的表空间名] order by bytes desc;
-- 3、	将实际占用大小累加在一起，与物理表空间比对(单位MB)
Select sum(bytes)/1024/1024 from dba_segments where tablespace_name=[步骤1查询到的表空间名] order by bytes desc;
-- 4、	如果比对的上，那确认大表源头存储重要数据，如果不是则使用truncate语句；如果比对不上，那么直接修改表空间（收缩后表空间要比实际表空间要大一点）。
Alter database datafile [步骤1查到的你想收缩的文件file_id] resize [收缩后的大小]
-- 例： alter database datafile 1 resize 1024M;
