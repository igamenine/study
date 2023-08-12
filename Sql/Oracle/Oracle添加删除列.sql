--添加一列
ALTER TABLE table_name ADD column_1 DATE NOT NULL; 
ALTER TABLE table_name ADD column_2 VARCHAR2(44) DEFAULT ''; 
ALTER TABLE table_name ADD column_3 number(28,10); 
--添加多列
ALTER TABLE table_name
    ADD (
        column_1 type [constraint],
        column_2 type [constraint],
        ...
    );
ALTER TABLE TEST 
    ADD (
        x int,
        c varchar2(200)
    );
 
--删除一列
ALTER TABLE table_name DROP COLUMN column_name;
--删除多列
ALTER TABLE table_name DROP (column_1,column_2,...);