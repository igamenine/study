# 1、json.dumps()和json.loads()是json格式处理函数（可以这么理解，json是字符串）
# 　　(1)json.dumps()函数是将一个Python数据类型列表进行json格式的编码（可以这么理解，json.dumps()函数是将字典转化为字符串）
# 　　(2)json.loads()函数是将json格式数据转换为字典（可以这么理解，json.loads()函数是将字符串转化为字典）
# 2、json.dump()和json.load()主要用来读写json文件函数
# 注意：json只能处理双引号的字典，推荐自己使用ast.literal_eval转字典，本脚本旨在解释他人脚本
import json

info = '{"a": "1"}'
info_dict = json.loads(info)
print(type(info_dict))
print(info_dict)
info_str = json.dumps(info_dict)
print(type(info_str))
print(info_str)
