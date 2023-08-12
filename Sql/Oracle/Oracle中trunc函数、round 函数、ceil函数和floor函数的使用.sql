1.1trunc函数处理数字

trunc函数返回处理后的数值，其工作机制与ROUND函数极为类似，只是该函数不对指定小数前或后的部分做相应舍入选择处理，而统统截去。
其具体的语法格式如下
TRUNC（number[,decimals]）
其中：
number 待做截取处理的数值
decimals 指明需保留小数点后面的位数。可选项，忽略它则截去所有的小数部分。
 select trunc(123.98)from dual;
 select trunc(123.123,2)from dual;
 select trunc(123.123,-1)from dual;
 

注意：第二个参数可以为负数，表示为小数点左边指定位数后面的部分截去，即均以0记。与取整类似，比如参数为1即取整到十分位，如果是-1，则是取整到十位，以此类推；如果所设置的参数为负数，且负数的位数大于或等于整数的字节数的话，则返回为0。如：TRUNC(89.985,-3)=0。

1.2trunc函数处理日期
trunc函数返回以指定元元素格式截去一部分的日期值。
其具体的语法格式如下：
TRUNC（date,[fmt]）
其中：
date为必要参数，是输入的一个日期值
fmt参数可忽略，是日期格式，用以指定的元素格式来截去输入的日期值。忽略它则由最近的日期截去
下面是该函数的使用情况：
 trunc(sysdate,'yyyy') --返回当年第一天.
 trunc(sysdate,'mm') --返回当月第一天.
 trunc(sysdate,'d') --返回当前星期的第一天.
 select trunc(sysdate,'YYYY')from dual;
 select trunc(sysdate,'MM')from dual;
 select trunc(sysdate,'D')from dual;
2.round函数(四舍五入）

描述 : 传回一个数值，该数值是按照指定的小数位元数进行四舍五入运算的结果。

1 SELECT ROUND( number, [ decimal_places ] ) FROM DUAL
参数:

number : 欲处理之数值
decimal_places : 四舍五入 , 小数取几位 ( 预设为 0 )
 Sample :
 select round(123.456, 0) from dual;          回传 123
 select round(123.456, 1) from dual;          回传 123.5
 select round(-123.456, 2) from dual;        回传 -123.46
3.ceil和floor函数

ceil和floor函数在一些业务数据的时候，有时还是很有用的。
ceil(n) 取大于等于数值n的最小整数；
floor(n)取小于等于数值n的最大整数；

转自https://www.cnblogs.com/yw0219/p/5789664.html