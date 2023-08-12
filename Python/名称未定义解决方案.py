# name ‘reload‘ is not defined
# 一段python2.7的代码，里面有如下代码：

# reload(sys)

# sys.setdefaultencoding("utf-8")

# 重新加载sys模块，并设置默认编码utf-8

# 在Python 3.x中运行提示：

# name ‘reload’ is not defined

# python3.x下应该改为如下方式：

import importlib

importlib.reload(sys)

# 最后一句sys.setdefaultencoding(“utf-8”) python3.x下就不需要了，默认编码就是utf-8
