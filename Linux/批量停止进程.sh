ps -aux|grep syncd|grep -v grep|grep -v 2001|grep -v 2002|grep -v 20032|grep -v 2049|awk '{print "kill "$2}'|sh
ps aux|grep rmqbxt|grep -v grep|awk '{print "kill "$2}'|sh
ps aux|grep tomcat|grep -v grep|awk '{print "kill "$2}'|sh
ps aux|grep src_oracle_txzt|grep -v grep|awk '{print "kill "$2}'|sh