# 注意：挂载的需要是不会自动关闭的进程，如果命令执行完毕后会自动关闭则不受后台控制
nohup 命令 &
setsid 命令 &
(命令 &)

# 例子
nohup ping 127.0.0.1 &>>后台运行测试.txt  &
setsid ping 127.0.0.1 &>>后台运行测试.txt
(ping 127.0.0.1 &>>后台运行测试.txt &)

# 注意：使用(命令 &)方式开启的后台守护进程不会返回进程PID，维护成本略高，工作中不推荐使用