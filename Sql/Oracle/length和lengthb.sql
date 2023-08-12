
select lengthb('你') from dual; -- 返回2,表示2-3个字节
 
select length('你') from dual; -- 返回1,表示1个字符

select userenv('language') from dual;
-- 如果显示SIMPLIFIED CHINESE_CHINA.ZHS16GBK，一个汉字占用两个字节;——GBK
-- 如果显示SIMPLIFIED CHINESE_CHINA.AL32UTF8，一个汉字占用三个字节.——UTF8

-- 字符串类型字段默认的长度是以字节为单位的，具体取决于参数nls_length_semantics 的值
-- (使用show parameters可以看到这个参数的值)，默认是BYTE，也就是以字节为单位的，如果是CHAR则是以字符为单位的。