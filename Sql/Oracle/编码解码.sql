-- url码
-- 解码
utl_url.unescape(cslb, 'UTF-8') -- 编码格式不统一，如果如何解码可换GB2312尝试解码
-- 编码
utl_url.escape(cslb, 'UTF-8')