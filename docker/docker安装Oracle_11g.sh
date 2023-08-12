#此方法适用于x86架构的docker系统，arm64架构挂在docker后即使安装成功也无法连接Oracle，会显示连接丢失，原因在于Oracle使用到了arm64无法完全模拟的底层技术，不过据说lima虚拟机能解决，感兴趣的可以自行操作。

# 方法二（推荐）
docker pull wnameless/oracle-xe-11g-r2:18.04-apex
docker run -d --name oracle -p 1521:1521 wnameless/oracle-xe-11g-r2:18.04-apex
sqlplus system/oracle@localhost:1521/xe
# 图文参考https://github.com/iamseth/oracledb_exporter

# 方法一
#1、拉取阿里云提供的Oracle11g镜像  如有防火墙请开启对应端口
docker pull registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g
#2、创建容器
docker run -d -p 1521:1521 --name oracle11g registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g
#3、查看容器是否创建并运行，如果没有则执行docker start oracle11g
docker ps -a
#4、进入容器
docker exec -it oracle11g bash
#5、切换至root用户配置/etc/profile文件，密码为helowin
su root
#6、编辑/etc/profile文件，在最后添加3行配置，添加完毕后:wq!
export ORACLE_HOME=/home/oracle/app/oracle/product/11.2.0/dbhome_2
export ORACLE_SID=helowin
export PATH=$ORACLE_HOME/bin:$PATH
#7、刷新/etc/profile
source /etc/profile
#8、为sqlplus创建快捷方式
ln -s $ORACLE_HOME/bin/sqlplus /usr/bin
#9、切换到Oracle用户，注意切换都要加-同时切换到新用户的工作环境中,否则会出现路径不一致错误
su - oracle
#10、登录sqlplus修改sys、system密码，密码可自定义。
sqlplus /nolog
conn /as sysdba
alter user system identified by oracle;
alter user sys identified by oracle;
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
exit
#11、修改完毕后查看监控状态，如未开启则重启
lsnrctl status
#12、如果有防火墙则开启1521端口，如果在云上则检查云平台防火墙放开1521端口，然后尝试用Navicat或plsql连接数据库。