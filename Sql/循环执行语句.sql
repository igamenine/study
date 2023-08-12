-- mysql - benchmark
-- 通常用作测试语句性能
benchmark([执行次数], [执行函数])
SELECT BENCHMARK(1000000,1+1);

CREATE PROCEDURE `doiterate`(p1 INT, p2 int)
BEGIN
  label1: LOOP
    SET p1 = p1 + 1;
    IF p1 < p2 THEN
			insert into test values(p1, null);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
END

-- Oracle - loop if
create or replace procedure proc_test_loop is
v_num number;
i char(10);
begin
    v_num:=-1; -- 初始化变量，一般为0，根据实际需求变化
    loop
        v_num:=v_num + 1;
        if v_num < 7 then select to_char(sysdate + v_num, 'DY') into i from dual; -- 实际执行语句
        DBMS_OUTPUT.PUT_LINE(i); -- 打印结果
        else exit;
        end if;
    end loop;
end proc_test_loop;

