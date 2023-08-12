# 手动设置MaxPermSize大小，如果是linux系统，修改TOMCAT_HOME/bin/catalina.sh，如果是windows系统，修改TOMCAT_HOME/bin/catalina.bat，
# 在“echo "Using CATALINA_BASE: $CATALINA_BASE"”上面加入以下行，大小参数按实际需求走：
# 注意：此方法只是通过加大tomcat内存使用量来延长软件运行过久造成内存溢出问题的时间，没有从根本上解决问题，如需彻底解决请指教程序研发人员

JAVA_OPTS="-server -Xms1024m -Xmx1024m -XX:MaxNewSize=512m -XX:MaxPermSize=512m"

# eclipse请参阅https://blog.csdn.net/u010716879/article/details/79395292