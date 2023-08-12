----查看oracle数据库字符集编码
select * from nls_database_parameters where parameter ='NLS_CHARACTERSET';
----查看客户端主机支持的字符集编码
select userenv('language') from dual;
----Oracle客户端字符集环境编码
select * from nls_instance_parameters where parameter='NLS_LANGUAGE';
-- 转自https://www.jb51.net/article/53078.htm
-- 如果需要修改字符集参考上述网站描述,不推荐修改