-- 关闭数据库
-- 命令有 normal immediate abort，一般用immediate
shutdown [命令]
shutdown immediate
-- 开启数据库
-- 命令有 nomount mount open restrict force exclusive
startup
startup [命令]
-- startup 等于以下三个命令
startup nomount
alter database mount
alter database open
-- 1、startup nomount
-- 非安装启动，这种方式下启动可执行：重建控制文件、重建数据库，读取init.ora文件，启动instance，即启动SGA和后台进程，这种启动只需要init.ora文件。
-- 2、startup mount (dbname)
-- 安装启动，这种方式启动下可执行：数据库日志归档、数据库介质恢复、使数据文件联机或脱机、重新定位数据文件、重做日志文件。


