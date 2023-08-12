-- 通过binlog参数（expire_logs_days ）来实现mysql自动删除binlog

show binary logs;
show variables like 'expire_logs_days'; --//该参数表示binlog日志自动删除/过期的天数，默认值为0，表示不自动删除
set global expire_logs_days=3; --//表示日志保留3天，3天后就自动过期。

-- 更多参看https://zhuanlan.zhihu.com/p/106766282