-- msyql&oracle
case when condition then value ... else end
-- case when 语句会从上往下判断，只要判断成立就结束，优先级从上往下，所以不用担心重复判断，但要排好各值优先级

--oracle
decode(condition1, value1, condition2, value2, ..., defalutvalue)