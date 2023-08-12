-- mysql
-- instr(col, char) 在col中查找char出现的第一个位置
instr('123123123', '1')
-- 返回结果
1

-- Oracle
-- instr(col, char[, postition, count]) 在col中查找char在postition起出现的第count个位置
instr('123123123', '1', 3, 2)
-- 返回结果
7
