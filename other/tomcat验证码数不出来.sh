# 项目在window中使用POI导出Excel没有任何问题，而到linux中使用POI导出Excel出现：java.lang.NoClassDefFoundError: sun/awt/X11GraphicsEnvironment异常信息
# 在tomcat配置文件catalina.sh文件中添加
CATALINA_OPTS="-Djava.awt.headless=true"


# catalina.sh添加之后如下：
#   LOGGING_CONFIG  (Optional) Override Tomcat's logging config file
#                   Example (all one line)
#                   LOGGING_CONFIG="-Djava.util.logging.config.file=$CATALINA_BASE/conf/logging.properties"
#
#   LOGGING_MANAGER (Optional) Override Tomcat's logging manager
#                   Example (all one line)
#                   LOGGING_MANAGER="-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager"
#
# $Id: catalina.sh 1146097 2011-07-13 15:25:05Z markt $
# -----------------------------------------------------------------------------
 
JAVA_OPTS="-Xms512m -Xmx19500m"
CATALINA_OPTS="-Djava.awt.headless=true"
# OS specific support.  $var _must_ be set to either true or false.
cygwin=false
os400=false
darwin=false
case "`uname`" in
CYGWIN*) cygwin=true;;
OS400*) os400=true;;
Darwin*) darwin=true;;
esac
 
# resolve links - $0 may be a softlink
PRG="$0"
 
while [ -h "$PRG" ]; do