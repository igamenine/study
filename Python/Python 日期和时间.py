#!/usr/bin/python3
# -*- coding: UTF-8 -*-
# 参看https://www.runoob.com/python/python-date-time.html

import time
# 日历依赖
import calendar

# 时间默认格式
print(time.time())
# 从返回浮点数的时间戳方式向时间元组转换
print (time.localtime(time.time()))
# 格式化成2016-03-20 11:45:39形式
print (time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()) )
 
# 格式化成Sat Mar 28 22:24:24 2016形式
print (time.strftime("%a %b %d %H:%M:%S %Y", time.localtime()) )
  
# 将格式字符串转换为时间戳
a = "Sat Mar 28 22:24:24 2016"
print (time.mktime(time.strptime(a,"%a %b %d %H:%M:%S %Y")))


 
cal = calendar.month(2016, 1)
print ("以下输出2016年1月份的日历:")
print (cal)
print(type(cal))
