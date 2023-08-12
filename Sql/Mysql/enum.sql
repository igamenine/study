-- enum即枚举类型简单来说就是mysql对于枚举法的应用，它是表结构中的表结构;
-- 它会构造一个内部的二维字典，序列从1开始，序列0为空字符串用于转存不在列表内的值，NULL为序列NULL的值（如果字段允许为空），如果NOT NULL那默认取序列1的值，枚举字段的排序遵循内部序列，除非order by concat(col)

CREATE TABLE shirts (
    name VARCHAR(40),
    size ENUM('x-small', 'small', 'medium', 'large', 'x-large')
);

-- 使用where条件筛选枚举类型时，使用序列或列值均可，但是用序列时不准加引号
select size from shirts where size = 1;
select size from shirts where size = 'x-small';
-- 结果
-- 'x-small'

-- 更多参见https://www.zhihu.com/question/404422255