-- 该需求在客户要求建立数据目录时会用到，要根据具体需求创建

-- mysql


-- oracle
SELECT 
--t1.Table_Name || chr(13) || t3.comments       AS "表名称及说明",
     ROWNUM ,
       t1.Column_Name                                AS "字段名称",
       t1.DATA_TYPE             AS "数据类型",
             t1.DATA_LENGTH    AS "长度",
       t1.NullAble                                   AS "是否为空",
       t2.Comments                                   AS "字段说明",
       t1.Data_Default "默认值"
       --t4.created                                  AS "建表时间"
               --t3.comments                                 AS "表说明",
  FROM cols t1
  LEFT JOIN user_col_comments t2 
         ON t1.Table_name = t2.Table_name
        AND t1.Column_Name = t2.Column_Name
  LEFT JOIN user_tab_comments t3 
         ON t1.Table_name = t3.Table_name
  LEFT JOIN user_objects t4 
         ON t1.table_name = t4.OBJECT_NAME
  WHERE NOT EXISTS (SELECT t4.Object_Name
          FROM User_objects t4
         WHERE t4.Object_Type = 'TABLE'
           AND t4.Temporary = 'Y'
           AND t4.Object_Name = t1.Table_Name)
                     and t1.TABLE_NAME='你要查询的表名'
  ORDER BY t1.Table_Name, t1.Column_ID; 