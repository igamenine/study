-- ORA-01830: 日期格式图片在转换整个输入字符串之前结束
-- 运行以下语句会报错，原因是to_date无法转换秒以后的精度
select to_date('2005-10-01 12:01:01.0','yyyy-mm-dd hh24:mi:ss') from dual;
-- 解决办法是使用截取函数删除小数点
select to_date(substr('2005-10-01 12:01:01.0', 1, 19),'yyyy-mm-dd hh24:mi:ss') from dual;