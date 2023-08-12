-- oracle
UPDATE 表名 SET  字段= REPLACE(REPLACE(字段, CHR(10), ''), CHR(13), ''); 
UPDATE 表名 SET  字段= TRANSLATE (t.trafficname, CHR (13) || CHR (10), ','); -- translate无法将目标替换成空值，这会导致整个内容变空 
-- mysql
UPDATE 表名 SET  字段= REPLACE(REPLACE(字段, CHAR(10), ''), CHAR(13), ''); 