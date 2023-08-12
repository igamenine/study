-- trim(col) 替换左右空格，但是不能替换中间空格，局限性很大一般不使用。如果要替换左边则ltrim右边则rtrim
select trim(' 12 3 ') from dual;
-- 结果
'12 3'

-- replace(col, oldchar, newchar) 将col中的oldchar替换成newchar，一次只能替换一种，如果需要替换多种字符需要嵌套多次，但可以替换所有空格
select replace(' 12 3 ', ' ', '') from dual;
-- 结果
'123'

-- translate(col, oldchars, newchars) 将col中的oldchars替换成newchars，一次能替换多种字符，但不能替换空格
select translate(' 12 3 ', '12', '34') from dual;
-- 结果
' 34 3 '
-- 可以结合replace替换多种字符和空格保留想要的内容
SELECT REPLACE(TRANSLATE ('{"hpzl":"02"}', 'hpzl":''{}', ' '), ' ', '') FROM dual;
-- 结果
'02'
