-- 转自https://www.runoob.com/mysql/mysql-temporary-tables.html
-- MySQL 临时表在我们需要保存一些临时数据时是非常有用的。临时表只在当前连接可见，当关闭连接时，Mysql会自动删除表并释放所有空间。
-- 临时表在MySQL 3.23版本中添加，如果你的MySQL版本低于 3.23版本就无法使用MySQL的临时表。不过现在一般很少有再使用这么低版本的MySQL数据库服务了。
-- MySQL临时表只在当前连接可见，如果你使用PHP脚本来创建MySQL临时表，那每当PHP脚本执行完成后，该临时表也会自动销毁。
-- 如果你使用了其他MySQL客户端程序连接MySQL数据库服务器来创建临时表，那么只有在关闭客户端程序时才会销毁临时表，当然你也可以手动销毁。
-- 临时表的创建只是在平常的create table中间添加了声明，所以你可以当作是正常创建表的流程走，比如可以添加索引（不过一般没人这么做，因为意义不大）
-- 创建语句
CREATE TEMPORARY TABLE SalesSummary (
    product_name VARCHAR(50) NOT NULL
    , total_sales DECIMAL(12,2) NOT NULL DEFAULT 0.00
    , avg_unit_price DECIMAL(7,2) NOT NULL DEFAULT 0.00
    , total_units_sold INT UNSIGNED NOT NULL DEFAULT 0
);

-- 临时表的创建可以直接使用如下语句，效果等同于create table 临时表名 as select * from 旧的表名
CREATE TEMPORARY TABLE 临时表名 AS
(
    SELECT *  FROM 旧的表名
    LIMIT 0,10000
);