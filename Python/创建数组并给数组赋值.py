import numpy as np
x = np.empty([3,2], dtype = int) #注意，初始化的数组会有随机数据，需要通过实际需要赋值替换
x[0][0] = 1
x[0][1] = 2
print(x)