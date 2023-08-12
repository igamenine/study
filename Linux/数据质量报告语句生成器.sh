#!/bin/bash

# Define the table name and field list
table_name=$1
field_list=$2

# Generate the SQL script
cat <<EOF > stats.sql
SELECT
  COUNT(*) AS total_count,
  COUNT(DISTINCT ${field_list}) AS dedup_count,
  1 - COUNT(DISTINCT ${field_list}) / COUNT(*) AS data_duplication_rate,
  COUNT(CASE WHEN ${field_list} IS NULL OR ${field_list} = '' THEN 1 ELSE NULL END) / COUNT(*) AS dirty_data_percentage
FROM ${table_name};
EOF

# Print the SQL script
cat stats.sql

mysql -u username -p < stats.sql

echo -e "This is the first line.\nThis is the second line."