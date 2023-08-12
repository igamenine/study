-- scott/tige 登陆  ORA-28000:the account is locked
-- system/manager 登陆 ORA-01031:insufficient privileges
-- oracle有三个默认的用户名和密码
-- 1.用户名:sys密码:change_on_install
-- 如果想使用sqlplus登录,密码必须加上as sysdba，即完整密码为：change_on_install as sysdba
-- 2.用户名:system密码:manager
-- 3.用户名:scott密码:tiger
-- 1.使用sysdba账号 登陆后 可以修改其他账号密码           
-- 运行 cmd 按如下输入命令
sqlplus / as sysdba ---------以sys登陆 超级用户（sysdba）
-- 2.解除锁定账号
alter user 用户名 account unlock; --------- 解除锁定(必须带“;”号)
-- 以system用户名为例，即命令为
alter user system account unlock;
-- 3.为该账户设置新密码
alter user 用户名 identified by 密码; -------------修改密码（密码加不加双引号均可，必须带“;”号）
-- 以用户名system密码dhee为例，即命令为
alter user system identified by dhee;
-- 然后用你改好的密码登陆。
