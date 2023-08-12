select SUBSTRING_INDEX(host,':',1) as ip , count(*) from information_schema.processlist group by ip;

-- 更多参见https://jingyan.baidu.com/article/90895e0f0fecc364ec6b0b0c.html