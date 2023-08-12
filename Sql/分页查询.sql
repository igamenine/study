-- mysql
select * from tablename order by id limit 1, 10;


-- oracle
SELECT *

  FROM (SELECT tt.*, ROWNUM AS rowno

          FROM (  SELECT t.*

                    FROM emp t

                   WHERE hire_date BETWEEN TO_DATE ('20060501', 'yyyymmdd')

                                       AND TO_DATE ('20060731', 'yyyymmdd')

                ORDER BY create_time DESC, emp_no) tt

         WHERE ROWNUM <= 20) table_alias

 WHERE table_alias.rowno >= 10;

-- 转自https://blog.csdn.net/use_admin/article/details/83622414