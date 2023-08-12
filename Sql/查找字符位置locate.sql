-- mysql&oracle
-- 默认会返回指定字符第一次出现的位置
instr([字段名], [查找字符])

-- mysql - locate()
locate([查找字符], [字段名], [查找的位置，默认从1开始]),如：

locate('/', columnname);

-- 注意：位置不是第几个，比如说要查找第二个/号，不是填2，而是填第一个/号+1的位置，案例如下：

locate(‘/’, columnname, locate(‘/’, columnname)+1);

-- locate的参数位置和instr是相反的，与instr相比优势是可以查找字符的多个位置，instr只会返回第一个位置

-- 扩展阅读：
-- 在字符串较长的情况下，like性能比locate和instr好一倍，instr与locate性能接近；
-- 在字符串较短的情况下，instr略优于locate，locate略优于like。

-- oracle - instr()
-- oracle的inset有3个参数，可以当做locate使用
instr([字段名], [查找字符], [查找的位置], [出现次序])

instr('aaacpuaaacpuaaacpu', 'cpu', 1, 2)

-- mysql&hive
position([查找字符] in [字段名])

position(":" in pns)