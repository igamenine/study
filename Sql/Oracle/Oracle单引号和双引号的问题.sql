-- Oracle的双引号只应用在createtable时与where时明确字段大小写，如果不明确默认统一转换成大写，如：
CREATE TABLE xq.test_syh("A" int);
CREATE TABLE xq.test_syh("a" int);
SELECT * FROM xq.test_syh WHERE "A" IS null;
SELECT * FROM xq.test_syh WHERE "a" IS null;
CREATE TABLE "TableName"(id number); -- 表名中大小写都有，加上双引号Oracle会严格遵守，想使用该表就比较麻烦
-- Oracle的单引号用在字符串上，如：
select 'asd' from dual;
select * from xq.test_syh where a = 'asd';
select '''asd' from dual; -- 会返回【'asd】，即遵守单引号内单引号复写合一规则