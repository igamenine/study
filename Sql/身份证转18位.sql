UPDATE tableA SET ID = CONCAT
    (
    SUBSTRING(ID, 1, 6), '19', SUBSTRING(ID, 7, 9), SUBSTRING('10X98765432', 
        (CAST(SUBSTRING(ID, 1, 1)AS SIGNED)*7+
        CAST(SUBSTRING(ID, 2, 1)AS SIGNED)*9+
        CAST(SUBSTRING(ID, 3, 1)AS SIGNED)*10+
        CAST(SUBSTRING(ID, 4, 1)AS SIGNED)*5+
        CAST(SUBSTRING(ID, 5, 1)AS SIGNED)*8+
        CAST(SUBSTRING(ID, 6, 1)AS SIGNED)*4+
        1*2+
        9*1+
        CAST(SUBSTRING(ID, 7, 1)AS SIGNED)*6+
        CAST(SUBSTRING(ID, 8, 1)AS SIGNED)*3+
        CAST(SUBSTRING(ID, 9, 1)AS SIGNED)*7+
        CAST(SUBSTRING(ID, 10, 1)AS SIGNED)*9+
        CAST(SUBSTRING(ID, 11, 1)AS SIGNED)*10+
        CAST(SUBSTRING(ID, 12, 1)AS SIGNED)*5+
        CAST(SUBSTRING(ID, 13, 1)AS SIGNED)*8+
        CAST(SUBSTRING(ID, 14, 1)AS SIGNED)*4+
        CAST(SUBSTRING(ID, 15, 1)AS SIGNED)*2)%11+1, 1))
        WHERE LENGTH(ID)=15;
CONCAT
    (
    SUBSTRING(b_cradid, 1, 6), '19', SUBSTRING(b_cradid, 7, 9), SUBSTRING('10X98765432', 
        (CAST(SUBSTRING(b_cradid, 1, 1)AS SIGNED)*7+
        CAST(SUBSTRING(b_cradid, 2, 1)AS SIGNED)*9+
        CAST(SUBSTRING(b_cradid, 3, 1)AS SIGNED)*10+
        CAST(SUBSTRING(b_cradid, 4, 1)AS SIGNED)*5+
        CAST(SUBSTRING(b_cradid, 5, 1)AS SIGNED)*8+
        CAST(SUBSTRING(b_cradid, 6, 1)AS SIGNED)*4+
        1*2+
        9*1+
        CAST(SUBSTRING(b_cradid, 7, 1)AS SIGNED)*6+
        CAST(SUBSTRING(b_cradid, 8, 1)AS SIGNED)*3+
        CAST(SUBSTRING(b_cradid, 9, 1)AS SIGNED)*7+
        CAST(SUBSTRING(b_cradid, 10, 1)AS SIGNED)*9+
        CAST(SUBSTRING(b_cradid, 11, 1)AS SIGNED)*10+
        CAST(SUBSTRING(b_cradid, 12, 1)AS SIGNED)*5+
        CAST(SUBSTRING(b_cradid, 13, 1)AS SIGNED)*8+
        CAST(SUBSTRING(b_cradid, 14, 1)AS SIGNED)*4+
        CAST(SUBSTRING(b_cradid, 15, 1)AS SIGNED)*2)%11+1, 1))
		
case
when char_length(is18w(jszh))=15 then
CONCAT
    (
    SUBSTRING(is18w(jszh), 1, 6), '19', SUBSTRING(is18w(jszh), 7, 9), SUBSTRING('10X98765432', 
        (CAST(SUBSTRING(is18w(jszh), 1, 1)AS SIGNED)*7+
        CAST(SUBSTRING(is18w(jszh), 2, 1)AS SIGNED)*9+
        CAST(SUBSTRING(is18w(jszh), 3, 1)AS SIGNED)*10+
        CAST(SUBSTRING(is18w(jszh), 4, 1)AS SIGNED)*5+
        CAST(SUBSTRING(is18w(jszh), 5, 1)AS SIGNED)*8+
        CAST(SUBSTRING(is18w(jszh), 6, 1)AS SIGNED)*4+
        1*2+
        9*1+
        CAST(SUBSTRING(is18w(jszh), 7, 1)AS SIGNED)*6+
        CAST(SUBSTRING(is18w(jszh), 8, 1)AS SIGNED)*3+
        CAST(SUBSTRING(is18w(jszh), 9, 1)AS SIGNED)*7+
        CAST(SUBSTRING(is18w(jszh), 10, 1)AS SIGNED)*9+
        CAST(SUBSTRING(is18w(jszh), 11, 1)AS SIGNED)*10+
        CAST(SUBSTRING(is18w(jszh), 12, 1)AS SIGNED)*5+
        CAST(SUBSTRING(is18w(jszh), 13, 1)AS SIGNED)*8+
        CAST(SUBSTRING(is18w(jszh), 14, 1)AS SIGNED)*4+
        CAST(SUBSTRING(is18w(jszh), 15, 1)AS SIGNED)*2)%11+1, 1))
else is18w(jszh) end