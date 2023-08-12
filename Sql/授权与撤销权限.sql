--mysql
--授权某张表的执行权限，可以授权增删改查或者所有
-- 注：我们可以直接update表mysql.user、mysql.db、mysql.tables_priv、mysql.columns_priv中的数据来修改权限，
-- 但修改完毕后需要执行flush privileges。
-- flush privileges的使用场景：
-- 当我们直接用DML语句修改系统权限表时，内存中的权限数组是不会同步更新的，此时我们就需要flush privileges来更新内存权限数据了。
GRANT privileges ON databasename.tablename TO 'username'@'host';
-- 案例
grant all on *.* to username;
grant select on databasename.tablename to username;
--撤销权限案例
revoke all on *.* from username;
revoke select on databasename.tablename from username;

--oracle
--Oracle中有角色的概念，如需授权特定表权限跟mysql一样，分别是connect, resource, dba
--connect理论上只能访问数据库，无法做其他操作，创建完毕后要检查
--resource可以在自己用户下对标进行增删改查操作
--dba有管理员角色的权限，可以拥有大部分权限,甚至可以删除系统表，请谨慎授权
--对用户进行权限调整后，用户需要重新连接才可以生效
grant connect to userName; --授予连接权限
grant unlimited tablespace to userName;--授予不限制的表空间  
grant select any table to userName; --授予查询任何表  
grant select any dictionary to userName;--授予 查询任何字典 
grant create session to circle;--授予登录权限
--撤销权限
revoke dba from userName;
--限制ip方法
在sqlnet.ora配置文件中添加配置，具体请参阅：
https://www.csdn.net/tags/OtDaUgwsMzk0MzktYmxvZwO0O0OO0O0O.html
