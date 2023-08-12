-- 模式与数据库的区别
-- database 和 schema 之间的基本区别是 database 定期操作而 schema 不经常更改。
-- schema 是数据库的结构定义，而数据库是组织和相互关联的数据的集合。
-- database 有 schema 和表的记录，但 schema 包括表、属性名称、属性类型、约束等。
-- DDL（数据定义语言）语句用于生成和修改 schema，而 DML（数据操作语言）用于数据库中的数据操作。
-- schema 不使用内存进行存储，但 database 使用。

-- 个人注：如果说关系是表，关系模式是表结构，那么模式就是数据库结构，数据库是模式的关系