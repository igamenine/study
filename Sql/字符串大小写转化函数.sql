-- mysql
--  lower(), uppper() 和 lcase(), ucase()
mysql> select lower('DDD');  
+--------------+  
| lower('DDD') |  
+--------------+  
| ddd          |  
+--------------+  
mysql> select upper('ddd');  
+--------------+  
|upper('ddd') |  
+--------------+  
| DDD          |  
+--------------+  
mysql> select lcase('DDD');  
+--------------+  
| lcase('DDD') |  
+--------------+  
| ddd          |  
+--------------+  
mysql> select ucase('ddd');  
+--------------+  
| ucase('ddd') |  
+--------------+  
| DDD          |  
+--------------+ 
通常情况下，我选择 lower(), upper() 来实现MySQL转换字符串大小写，因为这和其他数据库中函数相兼容。

