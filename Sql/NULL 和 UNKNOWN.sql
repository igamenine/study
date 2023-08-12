NULL 表示值未知。 空值不同于空白或零值。 没有两个相等的空值。 比较两个空值或将空值与其他任何值进行比较均返回 unknown，这是因为每个空值都是未知的。

空值一般表示数据未知、不适用或将在以后添加。 例如，客户的中间名首字母在客户下定单时可能不知道。

关于空值，请注意以下几点：

若要在查询中测试空值，请在 WHERE 子句中使用 IS NULL 或 IS NOT NULL。

可通过下列方法在列中插入空值：在 INSERT 或 UPDATE 语句中显式声明 NULL，或不让列出现在 INSERT 语句中。

空值无法用作将表中的一行与另一行区分开所需的信息（例如主键），或用于对行进行分布时所用的信息（例如分布键）。

如果数据中出现空值，则逻辑运算符和比较运算符有可能返回 TRUE 或 FALSE 以外的第三种结果 UNKNOWN。 这种对三值逻辑的需要是导致许多应用程序出错的根源。 包含 UNKNOWN 的布尔表达式中的逻辑运算符将返回 UNKNOWN，除非该运算符的结果不依赖于 UNKNOWN 表达式。 下面这些表提供了此行为的示例。

下表显示将 AND 运算符应用到两个布尔表达式（其中一个表达式返回 UNKNOWN）的结果。

表达式 1	表达式 2	结果
true	UNKNOWN	UNKNOWN
UNKNOWN	UNKNOWN	UNKNOWN
FALSE	UNKNOWN	FALSE
下表显示将 OR 运算符应用到两个布尔表达式（其中一个表达式返回 UNKNOWN）的结果。

表达式 1	表达式 2	结果
true	UNKNOWN	true
UNKNOWN	UNKNOWN	UNKNOWN
FALSE	UNKNOWN	UNKNOWN

-- 转自https://learn.microsoft.com/zh-cn/sql/t-sql/language-elements/null-and-unknown-transact-sql?view=sql-server-ver16