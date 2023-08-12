# mysql
# 备份所有数据库
mysqldump -uroot -p -A > all.sql
mysqldump -u username -p #all-databases > filename.sql
# 备份指定库
mysqldump –uroot –p 数据库名 [需要备份的表列表] > 备份文件.sql
mysqldump –uroot –p –lock-all-tables 数据库名 [需要备份的表列表] > 备份文件.sql
mysqldump –uroot –p 数据库名1 数据库名2 > 备份文件.sql
# 例子
table_name=$( mysql -uroot -p mcp_manager -s -N -e "show tables"|grep -v -E "(mcp_common_log|mcp_model_log|mcp_model_process_log|XXL_JOB_QRTZ_TRIGGER_LOG|xxl_job_log|mcp_biz_table_field_dictionary)")
mysqldump -uroot -p  mcp_manager $table_name > /home/mcp_manager_20211224.sql
# 更多导出方式请参看https://blog.csdn.net/carefree2005/article/details/113762170
# 恢复数据库 如果使用#all-databases参数备份了所有的数据库，那么恢复时不需要指定数据库
mysql -u root –p 数据库名 < 备份文件.sql


# Oracle
exp ywxy/ywxy@ORCL file=d:/daochu1.dmp;
# ywxy/ywxy@ORCL 是用户名/密码@数据库名
# file=d:/daochu1.dmp 是导出的路径
exp ywxy/ywxy@ORCL file=d:/daochu1.dmp full=y;
# ywxy/ywxy@ORCL 是用户名/密码@数据库名
# file=d:/daochu1.dmp 是导出的路径
# full=y 是导出全库
exp ywxy/ywxy@ORCL file=d:/daochu1.dmp owner=system;
# ywxy/ywxy@ORCL 是用户名/密码@数据库名
# file=d:/daochu1.dmp 是导出的路径
# owner=system 是要导出的库
exp ywxy/ywxy@ORCL file=d:/daochu1.dmp tables=C_ZX_QYJC;
# ywxy/ywxy@ORCL 是用户名/密码@数据库名
# file=d:/daochu1.dmp 是导出的路径
# tables=C_ZX_QYJC 是导出的表名字，多个表名则 (table1,table2)形式

# 导入数据库（其他导入参考上方命令加参数）
imp ywxy/ywxy@ORCL file=d:/daochu1.dmp;


# 拓展阅读
# 1，使用cmd命令行导入导出数据

# 　　1.1整库导出

# 　　　　整库导出：exp 管理员账号/密码 full=y;//参数full表示整库导出。导出后会在当前目录下生成一个EXPDAT.DMP的文件，此文件为备份文件。如果想导出数据到指定位置，并且取个名字，需要添加file参数。例如：exp system/123456 file= C:\person.dmp full=y。

# 　　1.2整库导入

# 　　　　　　整库导入：imp 管理员账号/密码 full=y file=C:\person.dmp。

# 　　1.3使用cmd命令按用户导出导入

# 　　　　　1.3.1 按用户导出：exp 管理员账号/密码 owner=用户名 file=C:\person.dmp。

# 　　　　　1.3.2 按用户导入：imp 管理员账号/密码 file=C:\person.dmp fromuser=用户名。

# 　　1.4使用cmd命令按表导出导入

# 　　　　　1.4.1按表导出：exp 管理员账号/密码 file=person.dmp tables=t_person,t_student。

# 　　　　　1.4.2按表导入：imp 管理员账号/密码 file =person.dmp tables=t_person,t_student。

# 2.）使用PL/SQL 开发工具导出导入数据

# 　　pl/sql工具包含三种方式导出oracle表结构和表数据，分别为：oracle export,SQL inserts,pl/sql developer。它们的含义如下：

# 　　第一种oracle export：导出的是.dmp格式的文件，.dmp文件是二进制文件，可以跨平台，包含权限等。

# 　　第二种SQL inserts ：导出的是.sql格式的文件，可以用文本编辑器查看，通用性比较好，效率不如第一种，适合小数据量的导入导出。需要注意的是表中不能有大字段（blob,clob,long）如果有则不能导出。

# 　　第三种pl/sql：导出的是.pde格式的文件，.pde为/pl/sql自有的文件格式，只能用pl/sql工具导入导出，文本编辑器不能查看。