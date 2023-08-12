sqlplus /nolog
conn sys / as sysdba
shutdown immediate
startup

# 注意看报错信息，数据库可能会关闭失败