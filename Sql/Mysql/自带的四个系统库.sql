-- information_schema
INFORMATION_SCHEMA提供对数据库元数据的访问 ，有关MySQL服务器的信息，例如数据库或表的名称，列的数据类型或访问权限。有时用于此信息的其他术语是数据字典和系统目录。该位置存储有关MySQL服务器维护的所有其他数据库的信息。
  该INFORMATION_SCHEMA数据库包含几个只读表。它们实际上是视图，而不是基表，因此没有与它们关联的文件，并且您不能在它们上设置触发器。另外，没有使用该名称的数据库目录。虽然你可以选择INFORMATION_SCHEMA与一个默认的数据库USE 语句，你只能读取表的内容，不执行 INSERT， UPDATE或 DELETE对他们的操作。information_schema库共计有61张表。
  对于大多数INFORMATION_SCHEMA表，每个MySQL用户都有权访问它们，但只能看到表中与用户具有适当访问权限的对象相对应的行。在某些情况下（例如，表中的ROUTINE_DEFINITION列 INFORMATION_SCHEMA ROUTINES），特权不足的用户会看到NULL。某些表具有不同的特权要求；为此，在适用的表格说明中提到了这些要求。例如，InnoDB表（名称以开头的表INNODB_）需要PROCESS特权。

-- mysql
mysql 的核心数据库，类似于 sql server 中的 master 表，主要负责存储数据库的用户、权限设置、关键字等 mysql 自己需要使用的控制和管理信息。(常用的，在 mysql.user 表中修改 root 用户的密码)。

-- performance_schema
主要用于收集数据库服务器性能参数。并且库里表的存储引擎均为 PERFORMANCE_SCHEMA，而用户是不能创建存储引擎为 PERFORMANCE_SCHEMA 的表。MySQL 5.7 默认是开启的。
参考： MySQL5.6 PERFORMANCE_SCHEMA 说明

-- sys
Sys库所有的数据源来自：performance_schema。目标是把 performance_schema 的复杂度降低，让 DBA 能更好的阅读这个库里的内容。让DBA更快的了解 DB 的运行情况。
