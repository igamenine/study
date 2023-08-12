在登陆MySQL的情况下
方法一：通过sql命令修改密码
命令格式：set password for 用户名@localhost = password('新密码'); 

新版本mysql 命令：alter user 用户名@localhos identified by '新密码';

例子：

set password for root@localhost = password('123'); 
 
alter user 'root'@'localhost' identified by '123';
方法二：用UPDATE直接修改user表
--使用mysql数据库
use mysql; 
--更改user表中指定用户的密码
update user set password=password('123') where user='root' and host='localhost'; 
--权限刷新
flush privileges;
 

在没有登陆的情况下
方法一：mysqladmin 命令
命令格式:   mysqladmin -u用户名 -p旧密码 password 新密码 

例子：将root用户的密码由123456改为123

mysqladmin   -u root -p 123456 password 123

方法二：忘记原密码的情况
以windows为例： 

1. 关闭正在运行的MySQL服务。 
2. 打开DOS窗口，转到mysql\bin目录。 
3. 输入mysqld --skip-grant-tables 回车。--skip-grant-tables 的意思是启动MySQL服务的时候跳过权限表认证。 
4. 再开一个DOS窗口（因为刚才那个DOS窗口已经不能动了），转到mysql\bin目录。 
5. 输入mysql回车，如果成功，将出现MySQL提示符 >。 
6. 连接权限数据库： use mysql; 。 
6. 改密码：update user set password=password("123") where user="root";（别忘了最后加分号） 。 
7. 刷新权限（必须步骤）：flush privileges;　。 
8. 退出 quit。 
9. 注销系统，再进入，使用用户名root和刚才设置的新密码123登录。
————————————————
版权声明：本文为CSDN博主「清风狂暴」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_38002337/article/details/79553100