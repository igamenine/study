udf是用户自定义的函数称呼，全称是user-defined functions，可能会因为不受系统管理而出现某些问题，如修改数据时，系统无法感知到，导致没有记录响应binlog日志等。
用户可以将udf内置到数据库中变成系统函数便于系统统一管理和调度，但流程比较复杂。