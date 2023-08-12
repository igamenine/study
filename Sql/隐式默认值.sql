-- 隐式默认值，则定义如下

-- 对于数字类型，默认值为 0，但对于使用 AUTO_INCREMENT 属性声明的整数或浮点类型，默认值是序列中的下一个值。
-- 对于 TIMESTAMP 以外的日期和时间类型，默认值为该类型的相应 「 零 」 值。如果启用了 explicit_defaults_for_timestamp 系统变量，那么 TIMESTAMP 类型的列的默认值也是 「 零 」 值。否则，对于表中的第一个 TIMESTAMP 列，默认值为当前日期和时间。
-- 对于 ENUM 以外的字符串类型，默认值为空字符串 （ ""）。对于 ENUM 类型，默认值是第一个枚举值