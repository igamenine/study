-- mysql&oracle
-- 只清除左右空格
trim(column)
-- 清除左空格
ltrim(column)
-- 清除右空格
rtrim(column)
-- 清除所有空格
replace(column, ' ', '')
-- 清除所有字符
replace(column, '[字符]', '')
-- 只清除左右字符
TRIM(BOTH '，' FROM '，，bar，，，')
-- 清除左字符
TRIM(LEADING '，' FROM '，，barxxx')
-- 清除右字符
TRIM(TRAILING '，' FROM 'barxxyz，，')


-- translate(col, oldchars, newchars) 将col中的oldchars替换成newchars，一次能替换多种字符，但不能替换空格
select translate(' 12 3 ', '12', '34') from dual;
-- 结果
' 34 3 '
-- 可以结合replace替换多种字符和空格保留想要的内容
SELECT REPLACE(TRANSLATE ('{"hpzl":"02"}', 'hpzl":''{}', ' '), ' ', '') FROM dual;
-- 结果
'02'
