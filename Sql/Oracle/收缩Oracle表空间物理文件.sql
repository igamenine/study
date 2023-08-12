-- 1.查找表空间对应的数据文件id，以USERS表空间为例：
select FILE_ID from dba_data_files where tablespace_name ='USERS'
-- 2.允许表空间进行收缩（对表空间进行融合）：
alter tablespace users coalesce;
-- 3.查询表空间中表对应的大小，好确定对哪张表进行操作：
select * from dba_segments where tablespace_name='USERS' and segment_type='TABLE'
-- 4.允许表进行行移动（某些表不能进行truncate，只能delete）
alter table test row movement;
-- 5.对表进行高水位线回收：
alter table test shrink space;
-- 6.最后，对第一步查出的数据文件id进行压缩（resize），大小一定要大于已用大小：
alter database datafile 4 resize 2000M;
-- 经过上述操作，扩大的表空间就可以收缩回正常尺寸了.
-- 转自https://blog.csdn.net/weixin_34284188/article/details/91794752