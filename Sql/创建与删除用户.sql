--mysql,如果不加ip限制默认%
create user 'username'@'%' identified by '[密码]';
create user username IDENTIFIED by 'PASSWORD';
-- 删除用户
drop user username;

--oracle
create user [username] identified by [password];
CREATE USER igamenine identified BY igamenine;
--创建用户后还要授权连接数据库的权限
grant connect to userName;
-- 删除用户
drop user username cascade;
