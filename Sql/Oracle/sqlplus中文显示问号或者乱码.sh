# 1、用以下语句查询数据库编码
select userenv('language') from dual;
# 2、在/etc/profile或者~/.bash_profile中添加以下声明
export NLS_LANG="1查到的编码"
# 3、刷新~/.bash_profile
source /etc/profile
# source ~/.bash_profile