-- 本文转自https://dwgeek.com/hive-pivot-table-transpose-rows-to-column-and-example.html
-- 创建数据透视表是数据仓库中相对常见的任务。在加载到目标表中之前，您可能必须将行转换为列，或将列转换为行。微软 excel 是一种流行的工具，可让您根据需要透视列。Apache Hive 尚不支持 Pivot 或 unpivot 功能。在 Hive 中实现同样的事情并非易事。您必须使用解决方法将行转置为列，反之亦然。
-- 但是，可以使用 Hive 中的 CASE 或解码语句将行转置为列。

-- 行转列
> select class,section,pass_fail,count from students;
+---------+----------+------------+--------+--+
|  class  | section  | pass_fail  | count  |
+---------+----------+------------+--------+--+
| CLASS2  | B        | FAIL       | 333    |
| CLASS2  | B        | PASS       | 543    |
| CLASS1  | A        | FAIL       | 123    |
| CLASS1  | A        | PASS       | 321    |
+---------+----------+------------+--------+--+

-- 请考虑以下示例将 pass_fail中的PASS 和 FAIL 行转换为一列。
SELECT class, 
       section, 
       Sum(CASE 
             WHEN pass_fail = 'PASS' THEN count 
             ELSE 0 
           END) AS PASS, 
       Sum(CASE 
             WHEN pass_fail = 'FAIL' THEN count 
             ELSE 0 
           END) AS FAIL 
FROM   students 
GROUP  BY class, 
          section; 

+---------+----------+-------+-------+--+
|  class  | section  | pass  | fail  |
+---------+----------+-------+-------+--+
| CLASS1  | A        | 321   | 123   |
| CLASS2  | B        | 543   | 333   |
+---------+----------+-------+-------+--+


> select month_id,sale_qty from sales_by_month;
+-----------+-----------+--+
| month_id  | sale_qty  |
+-----------+-----------+--+
| 201601    | 897456    |
| 201603    | 267156    |
| 201602    | 232253    |
| 201604    | 265646    |
| 201606    | 265654    |
| 201606    | 123457    |
+-----------+-----------+--+
