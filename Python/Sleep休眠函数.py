# 例1：循环输出休眠1秒
import time
i = 1
while i <= 3:
    print(i) # 输出i
    i += 1
    time.sleep(1) # 休眠1秒

# 例2：循环输出休眠100毫秒
i = 1
while i <= 3:
    print(i) # 输出i
    i += 1
    time.sleep(0.1) # 休眠0.1秒