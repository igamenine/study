# 不加信号编号（signum）的kill默认声明编号为15（sigterm），请求程序【终止】而非杀死，程序会在接收到请求善后完毕后才关闭
kill pid #等同于kill -15 pid
# 如果想要强行关闭进程可使用编号9（sigkill），当然仍会有少部分进程无法及时关闭，可能需要等待或者重启处理
kill -9 pid


# 转自https://www.cnblogs.com/liuhouhou/p/5400540.html