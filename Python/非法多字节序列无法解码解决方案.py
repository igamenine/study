# 直接使用open('a.txt','r')会报错'gbk' codec can't decode byte 0xa6 in position 36: illegal multibyte sequence
# 里面有中文，所以编码集要自己修改一下，带中文应该要用 “utf-8”这个编码集
#context manager 上下文管理器  with
with open('a.txt','r',encoding='utf-8') as f:
    result = f.readline()   #一行一行的读
    print( result )