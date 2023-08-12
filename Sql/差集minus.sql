-- 差集minus将a表中与b表重复的记录剔除掉
-- minus和intersect与join的区别是结果会去重，这点很重要！

-- Oracle

select * from a;
MINUS
select * from b;

-- 案例
declare
      num   number;
begin
    select count(1) into num from all_tables where owner = upper('xq') AND table_name = upper('test_minus1');
    if num > 0 then
        execute immediate 'drop table xq.test_minus1' ;
    end if;
end;
declare
      num   number;
begin
    select count(1) into num from all_tables where owner = upper('xq') AND table_name = upper('test_minus2');
    if num > 0 then
        execute immediate 'drop table xq.test_minus2' ;
    end if;
end;
CREATE TABLE xq.test_minus1 (
    id INT
);

CREATE TABLE xq.test_minus2 (
    id INT
);

INSERT INTO xq.test_minus1 VALUES (1);
INSERT INTO xq.test_minus1 VALUES (1);
INSERT INTO xq.test_minus1 VALUES (2);
INSERT INTO xq.test_minus1 VALUES (2);
INSERT INTO xq.test_minus1 VALUES (3);
INSERT INTO xq.test_minus2 VALUES (2);
INSERT INTO xq.test_minus2 VALUES (2);
INSERT INTO xq.test_minus2 VALUES (3);
INSERT INTO xq.test_minus2 VALUES (4);

SELECT * FROM xq.test_minus1
MINUS
SELECT * FROM xq.test_minus2;

-- 返回结果
1


-- mysql
drop table if exists igamenine.test_minus1;
drop table if exists igamenine.test_minus2;
 
CREATE TABLE igamenine.test_minus1 (
    id INT
);

CREATE TABLE igamenine.test_minus2 (
    id INT
);

INSERT INTO igamenine.test_minus1 VALUES (1);
INSERT INTO igamenine.test_minus1 VALUES (1);
INSERT INTO igamenine.test_minus1 VALUES (2);
INSERT INTO igamenine.test_minus1 VALUES (2);
INSERT INTO igamenine.test_minus1 VALUES (3);
INSERT INTO igamenine.test_minus2 VALUES (2);
INSERT INTO igamenine.test_minus2 VALUES (2);
INSERT INTO igamenine.test_minus2 VALUES (3);
INSERT INTO igamenine.test_minus2 VALUES (4);

SELECT
    distinct
    id
FROM
    igamenine.test_minus1 t1
        LEFT JOIN
    igamenine.test_minus2 t2 USING (id)
WHERE
    t2.id IS NULL;