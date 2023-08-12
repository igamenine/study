-- 1.主库遇到重复unique约束时，进行replace操作；

-- 2.replace在主库上面实际变化为delete+insert，但binlog记录的是update；

-- 3.备库重做update动作，更新主键，但由于update动作不会更新自增列值，导致更新后记录值大于自增列值

-- 更多参见https://www.cnblogs.com/cchust/p/3914935.html