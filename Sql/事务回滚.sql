-- WORK - 可选的。 它被Oracle添加为符合SQL标准。 使用或不使用WORK参数来发出ROLLBACK会导致相同的结果。
-- TO SAVEPOINT savepoint_name - 可选的。 ROLLBACK语句撤消当前会话的所有更改，直到由savepoint_name指定的保存点。 如果省略该子句，则所有更改都将被撤消。
-- FORCE ‘string’ - 可选的。它用于强制回滚可能已损坏或有问题的事务。 使用此子句，可以将单引号中的事务ID指定为字符串。 可以在系统视图中找到名为DBA_2PC_PENDING的事务标识。
-- 必须拥有DBA权限才能访问系统视图 - DBA_2PC_PENDING和V$CORRUPT_XID_LIST。
-- 您无法将有问题的事务回滚到保存点。
ROLLBACK [ WORK ] [ TO [SAVEPOINT] savepoint_name  | FORCE 'string' ];

-- 当前事务回滚
ROLLBACK;

-- 回滚到指定保存点
ROLLBACK TO SAVEPOINT savepoint1;

-- 强制回滚有问题的事务
ROLLBACK FORCE '22.14.67';

-- 案例：
SELECT * FROM xq.TEST_SYH ts ; -- 返回结果 2022
UPDATE xq.test_syh SET a = 2021;
SELECT * FROM xq.TEST_SYH ts ;
SAVEPOINT save1;
UPDATE xq.TEST_SYH SET a = 2020;
SELECT * FROM xq.TEST_SYH ts ;
SAVEPOINT save2;
UPDATE xq.TEST_SYH SET a = 2019;
SELECT * FROM xq.TEST_SYH ts ;
ROLLBACK TO SAVEPOINT save1;
SELECT * FROM xq.TEST_SYH ts ; -- 返回结果 2021