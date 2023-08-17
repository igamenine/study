alter table history_uint drop partition p201812050000;

-- hive
alter table tablename drop partition (logdate = datetiem);