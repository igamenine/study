-- 1、外键就是另一关系（表）的主键，外键允许为空，但不允许非法取值（取被参考关系主键以外的值）
-- 2、如果要删除或者更新被参考关系的主键需要设置级联更新或者级联删除，否则数据库会拒绝执行命令
-- 3、默认情况下，创建外键不会额外创建索引，如有需要则要手动创建相关索引
-- 4、因为性能上的考虑以及维护难度等原因，现代项目开发已经完全抛弃外键，此作记录与学习用

-- 创建外键约束
-- mysql
-- 更多参见https://www.runoob.com/sql/sql-foreignkey.html
CREATE TABLE Orders
(
O_Id int NOT NULL,
OrderNo int NOT NULL,
P_Id int,
PRIMARY KEY (O_Id),
CONSTRAINT fk_PerOrders FOREIGN KEY (P_Id)
REFERENCES Persons(P_Id)
-- ON [COMMAND]
);

ALTER TABLE Orders
ADD CONSTRAINT fk_PerOrders
FOREIGN KEY (P_Id)
REFERENCES Persons(P_Id);

-- 删除外键约束
ALTER TABLE Orders
DROP FOREIGN KEY fk_PerOrders;

-- 放任删除/更新(当子表存在引用时禁止删改主表)
ON DELETE/UPDATE NO ACTION

-- 限制删除/更新(当子表存在引用时禁止删改主表)
ON DELETE/UPDATE RESTRICT

-- 级联删除/更新(主表被删除也会删除子表引用的记录)
ON DELETE/UPDATE CASECADE

-- 删除/更新时置空(注意外键约束不能为非空)
ON DELETE/UPDATE SET NULL

-- 删除/更新时置默认值
ON DELETE/UPDATE SET DEFAULT

-- 在MySQL中，如果两个表存在主外关系，则有五种引用操作，分别是 cascade、no action、restrict、set null和set default，有很多人对no action的restrict区别搞不清楚，其实在MySQL中是一样的，原因如下：restrict是在修改或者删除之前去检查从表中是否有对应的数据，如果有，拒绝操作，而no action是来源标准的sql,在有些数据库中，会延迟检查,即在修改或者删除完以后去检查从表中是否有对应的数据，如果有，拒绝操作，但是在MySQL中，外键约束都会立即检查，所以两者等价。需要注意的是，set default只是MySQL 解析器认可，但是InnoDB和NDB 拒绝在定义表时，出现ON DELETE SET DEFAULT or ON UPDATE SET DEFAULT 语句。
-- ————————————————
-- 版权声明：本文为CSDN博主「fullStackChenZF」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
-- 原文链接：https://blog.csdn.net/fullstackchenzf/article/details/78031192




