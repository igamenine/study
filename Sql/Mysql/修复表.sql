-- 1、语法:repair table 表名 [选项]
-- 选项如下:
-- 　　　　QUICK 用在数据表还没被修改的情况下,速度最快
-- 　　　　EXTENDED 试图去恢复每个数据行,会产生一些垃圾数据行,万般无奈的情况下用
-- 　　　　USE_FRM 用在.MYI文件丢失或者头部受到破坏的情况下。利用.frm的定义来重建索引
-- 　　　　多数情况下,简单得用”repair table tablename”不加选项就可以搞定问题。但是当.MYI文件丢失或者头部受到破坏时,这样的方式不管用
repair table tablename;
-- 1 、当在从表中选择数据之时，你得到如下错误： 
-- Incorrect key file for table: '...'. Try to repair it 
-- 2 、查询不能在表中找到行或返回不完全的数据。 
-- 3 、Error: Table 'p' is marked as crashed and should be repaired 。 
-- 4 、打开表失败： Can't open file: ‘×××.MYI' (errno: 145) 。

-- 更多参见https://blog.csdn.net/cplasfc3/article/details/53129226

-- 2. 使用myisamchk修复MyISAM（使用场景不多，慎用）
-- myisamchk可以直接访问表文件，而无须启动MySQL服务器。
-- 进入datadir文件目录，执行基本命令：
myisamchk --backup --recover t1

-- 关于innodb的表也有修复方式，参见https://blog.csdn.net/qq_35440678/article/details/60321689

