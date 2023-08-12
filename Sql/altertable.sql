要向现有表添加新列，请按如下所示使用ALTER TABLE ADD COLUMN语句：

首先，在ALTER TABLE子句之后指定表名。其次，将新列及其定义放在ADD COLUMN子句之后。 请注意，COLUMN关键字是可选的，因此可以省略它。第三，MySQL允许通过指定FIRST关键字将新列添加到表的第一列。 它还允许您使用AFTER existing_column子句在现有列之后添加新列。如果没有明确指定新列的位置，MySQL会将其添加为最后一列。
要同时向表中添加两个或多个列，请使用以下语法：
ALTER TABLE table
ADD [COLUMN] column_name_1 column_1_definition [FIRST|AFTER existing_column],
ADD [COLUMN] column_name_2 column_2_definition [FIRST|AFTER existing_column],
...;
SQL
我们来看一些向现有表添加新列的示例。
//更多请阅读：https://www.yiibai.com/mysql/add-column.html

