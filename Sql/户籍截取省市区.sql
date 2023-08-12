case
when b_dmsm1 is null then '未知'
when b_dmsm1 regexp '省' then left(b_dmsm1, instr(b_dmsm1, '省'))
when b_dmsm1 regexp '自治区' then left(b_dmsm1, instr(b_dmsm1, '区'))
when b_dmsm1 regexp '市' then left(b_dmsm1, instr(b_dmsm1, '市'))
when b_dmsm1 regexp '区' then left(b_dmsm1, instr(b_dmsm1, '区'))
else '未知' end