# 注意：在Python严格来讲只有「字符串」而没有「字符」
import ast

info = "{'a': '1'}"

info_dict = ast.literal_eval(info)
print(type(info_dict))
print(info_dict)
info_str = str(info_dict)
print(type(info_str))
print(info_str)

info = '{"a": "1"}'

info_dict = ast.literal_eval(info)
print(type(info_dict))
print(info_dict)
info_str = str(info_dict)
print(type(info_str))
print(info_str)

# 除了ast.literal_eval以外还有json和eval，但各有优缺点，json只能处理双引号的字典，eval涉及到用户输入input时不屏蔽系统命令执行，感兴趣的可以自行查阅https://www.cnblogs.com/xiao-xue-di/p/11414210.html