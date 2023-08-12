-- userenv()函数可以查询用户的环境信息，可以查询的参数有：
-- 参数  	功能
-- CLINET_INFO 返回最高可达64个字节存储的用户会话信息,可由应用程序使用DBMS_APPLICATION_INFO包。
-- ENTRYID 返回当前审计条目编号。审计的EntryID序列细粒度的审计记录和定期审计记录之间共享。在分布式SQL语句不能使用这个属性。
-- ISDBA 如果用户已经被认证为dba;或者是通过操作系统或口令文件具有DBA特权的，返回“TRUE”，否则返回“FALSE”
-- LANG	返回ISO缩写语言名称，一个比现有的“语言”参数较短的形式
-- LNAGUAGE	返回数据库当前会话的语言、地域和字符集
-- SESSIONID	返回审计会话标识符。在分布式SQL语句不能指定此参数
-- SID	返回数据库会话ID
-- TERMINA	返回当前会话的终端操作系统的标识符。在分布式SQL语句，此参数返回了标识符为本地会话。在分布式环境中，此参数只支持远程SELECT语句，不用于远程INSERT，UPDATE或DELETE操作。
比较常用的几个功能：
1.如果想快速定位数据库字符集的话，可以这样用：
SQL> select userenv('language') from dual;

USERENV('LANGUAGE')
----------------------------------------------------
AMERICAN_AMERICA.ZHS16GBK

-- 修改字符集，详细请参考https://www.cnblogs.com/yss669/p/9969721.html
ALTER DATABASE character set INTERNAL_USE ZHS16GBK; 

2.想快速定位session id 的话，也可以用这个参数定位
SQL> select userenv('sessionid') from dual;

USERENV('SESSIONID')
--------------------
              349811

SQL> select userenv('sid') from dual;

USERENV('SID')
--------------
           140

3.想查看自己是不是dba权限用户

SQL> select userenv('isdba') from dual;

USEREN
------
FALSE

如果输入为false则不是dba,如果为ture则是dba权限
