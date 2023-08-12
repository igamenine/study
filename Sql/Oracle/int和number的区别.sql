-- INT类型是NUMBER类型的子类型，oracle本来就没有int类型，为了与别的数据库兼容，新增了int类型作为number类型的子集。
-- int类型只能存储整数;number可以存储浮点数，也可以存储整数；如果没有规定number的位数，那么默认存储39位长度的数值（四舍五入）
INSERT INTO xq.test_nvarchar(b) VALUES(1.222222222222222222222222222222222222225);
select * from xq.test_nvarchar;
-- 结果
1.22222222222222222222222222222222222223

-- 使用number(总位数, 小数点)定义浮点数位数
-- 假设定义SAL列为NUMBER（6,2）则整数最大位数为4位（6-2=4），而小数最大位数为2位。

