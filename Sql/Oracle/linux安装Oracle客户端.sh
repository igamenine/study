# 1.前往官方网站下载对应系统的basic和sqlplus(推荐12.1)的rpm
https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html
# 2.将上面的压缩包解压至目标目录部署,推荐/opt/oracle
rpm -ivh 
# 3.编辑/etc/profile在底部新增以下内容 不要忘记刷新source
export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib:$LD_LIBRARY_PATH

export ORACLE_HOME=/usr/lib/oracle/12.1/client64

export LD_LIBRARY_PATH=$ORACLE_HOME/lib

export PATH=$ORACLE_HOME/bin:$PATH
# 4.安装libaio
sudo yum install libaio
# 为sqlplus64创建软连接(如果使用的是64版本的rpm)
cd /usr/bin
ln -s sqlplus64 sqlplus
# 5.找个Oracle连连看
sqlplus username/password@ip:port/sid