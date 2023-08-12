-- 行转列
SELECT * FROM order_stats
PIVOT(
    COUNT(order_id)
    FOR category_name
    IN ( 
        'CPU',
        'VC',
        'MB',
        'Storage'
    )
)
ORDER BY status;

+------------+------+-----+-----+----------+--+
|   status   | cpu  | vc  | mb  | storage  |
+------------+------+-----+-----+----------+--+
| cancelled  | 2    | 0   | 0   | 0        |
| pending    | 0    | 1   | 0   | 0        |
| shipped    | 1    | 1   | 1   | 1        |
+------------+------+-----+-----+----------+--+