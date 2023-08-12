# 1： who 命令查看
who -b 查看最后一次系统启动的时间。
    system boot  2022-07-08 13:50
who -r 查看当前系统运行时间
    run-level 3  2022-07-08 13:50
# 2： last  reboot
# 如下所示last reboot可以看到Linux系统历史启动的时间。 重启一下操作系统后，然后
last reboot
    reboot system boot 2.6.9-42.ELsmp Thu May 29 15:25 (00:07)
    reboot system boot 2.6.9-42.ELsmp Sun May 11 09:27 (18+05:55)
    wtmp begins Mon May 5 16:18:57 2014
    reboot system boot 2.6.9-42.ELsmp Thu May 29 15:25 (00:08) 
# 3：TOP命令查看
# 如下截图所示，up后表示系统到目前运行了多久时间。反过来推算系统重启时间
top
    top - 17:12:31 up 4 days,  3:21,  1 user,  load average: 0.03, 0.03, 0.05
# 4： w命令查看
# 如下截图所示，up后表示系统到目前运行了多久时间。反过来推算系统重启时间
w
    17:10:56 up 4 days,  3:20,  1 user,  load average: 0.00, 0.01, 0.05
    USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
    root     pts/0    60.190.217.110   14:05    0.00s  3.25s  3.25s -bash
# 5： 查看/proc/uptime
date -d "$(awk -F. '{print $1}' /proc/uptime) second ago" +"%Y-%m-%d %H:%M:%S" 
    2022-07-08 13:50:41