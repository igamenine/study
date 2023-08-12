-- mysql
select '1' = CAST('1' as UNSIGNED);

-- oracle
CREATE OR REPLACE
FUNCTION IS_NUMBER (STRING VARCHAR2)
RETURN VARCHAR2
IS    
   NUMING NUMBER;         
BEGIN
	IF STRING is null then
		return null;
	END IF;
	NUMING := to_number(STRING);        
		RETURN 'Y';    
	EXCEPTION WHEN OTHERS THEN         
		RETURN 'N';    
END IS_NUMBER;

select is_number([测试字符串]) from dual;
