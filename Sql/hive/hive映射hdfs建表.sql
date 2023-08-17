CREATE TABLE hive_hdfs_test
(
name	 string,
age	 string,
sex	 string
) partitioned by (logdate int)
row format delimited fields terminated by ','
location 'hdfs://namenodecluster/apps/hive/warehouse/xxxxx/hive_hdfs_test';