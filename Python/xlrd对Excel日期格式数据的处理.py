# 注意：xlrd==1.2.0之后的版本删除了对xlsx格式的Excel表支持，请使用1.2.0版本。本脚本可配合「Excel批量导入mysql.py」使用
# pip3 uninstall xlrd
# pip3 install xlrd==1.2.0
import xlrd

data = xlrd.open_workbook('../【更新】新闻宣传业务领域志愿者赛时每日到岗、运行情况统计表.xls')  # 打开表格
table = data.sheets()[0]  # 将表格的第一个sheet存入table变量

dt = xlrd.xldate_as_datetime(table.cell_value(56,3),0)
# 用1900年为时间基准，将第0行第3列的单元格值转换为datetime对象

# 根据一定的格式打印
print(type(dt))
print(dt)
print(dt.strftime("%Y/%m/%d"))
print(dt.strftime("%y/%m/%d"))
print(dt.strftime("%x %X"))
print(dt.strftime("%c"))

# 打印结果参考：
# <class 'datetime.datetimes'>
# 2022-02-27 00:00:00
# 2022/02/27
# 22/02/27
# 02/27/22 00:00:00
# Sun Feb 27 00:00:00 2022


# 拓展阅读
# 有关excel中日期格式的单元格（转自https://blog.csdn.net/qq_51292462/article/details/123163968）
# 1）实际上以 浮点数 的形式存储在单元格中，并不存在“日期”的数据类型；
# 2）存在一个 时间基准（datemode） ，不同的时间基准加上浮点数得到的实际日期不同。在一些函数的参数中，0 代表1900-01-01为基准，1 代表1904-01-01为基准，通常Windows使用前者，Mac使用后者。
# 将以浮点数形式存在的日期数据转换为可读的形式
# 1）xlrd.xldate_as_tuple(xldate,datemode) 函数
# 参数 xldate：要处理的单元格值（或浮点数）
# 参数 datemode：时间基准
# 返回值：返回元组（year,month,day,hour,minute,nearest_second）
# 2）xlrd.xldate.xldate_as_datetime(xldate,datemode) 函数
# 参数 xldate：要处理的单元格值（或浮点数）
# 参数 datemode：时间基准
# 返回值：datetime对象，格式 year-month-day hour:minute:second
# *注：excel的date对象与datetime对象不是同一概念，前者仅仅以 浮点数 的形式存在，并不存在相关的函数或参数，关于后者可以查阅相关的文档说明（https://xlrd.readthedocs.io/en/latest/api.html#module-xlrd.xldate）。