# 代码中经常会有变量是否为None的判断，有三种主要的写法：

#  第一种是`if x is None`；

# 第二种是 `if not x：`；

# 第三种是`if not x is None`（这句这样理解更清晰`if not (x is None)`） 。

# `if x is not None`是最好的写法，清晰，不会出现错误，以后坚持使用这种写法。

# 使用if not x这种写法的前提是：必须清楚x等于None,  False, 空字符串"", 0, 空列表[], 空字典{}, 空元组()时对你的判断没有影响才行。

 

# foo is None 和 foo == None的区别
# 如果比较相同的对象实例，is总是返回True 而 == 最终取决于 "eq()"

# ==只要相等，is表明要一样，同一个对象

print("进入函数")
# x = ""
# x = []
# x = 0
# x = {}
# x = None
x =["", [], {}, 0, None]
for i in x:
    if i is None:
        print(i, "：1 None")
    if not i:
        print(i, "：2 not")
    # `if x is not None`是最好的写法，清晰，不会出现错误，以后坚持使用这种写法。
    if not i is None:
        print(i, "：3 not is None")