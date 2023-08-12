# 声明使用suds包，然后根据webservice-wsdl页面的指引传参调用函数使用
# Python3使用的suds依赖包为suds-py3，请直接使用pip3 install suds-py3使用，否则会报错,如果是Python2则先安装Client再安装suds
# 更多信息请参考https://blog.csdn.net/weixin_43790276/article/details/89853310

# import suds

from suds.client import Client
 
# 注意：url必须以 "?wsdl" 结尾才能访问(不区分大小写),我们工作中的url可能是由其他语言的程序员提供的,他们使用时可能没有结尾的"?wsdl",使用Python调用时要自己加上
url = 'http://ws.webxml.com.cn/WebServices/MobileCodeWS.asmx?WSDL'
client = Client(url)
# 打印可调用接口列表
print(client)
# 打印getDatabaseInfo接口
print(client.service.getDatabaseInfo())
# 打印getMobileCodeInfo接口
print(client.service.getMobileCodeInfo(mobileCode=12345678900))

# WSDL是网络服务描述语言 (Web Services Description Language),是使用XML写的用于描述Web Services,以及如何访问 Web Services的文档,我们可以简单的这样理解:WSDL的作用类似于接口文档,告诉调用者有哪些接口,需要哪些参数,参数是什么类型,返回什么样的值.
# 转自https://blog.csdn.net/weixin_43790276/article/details/89853310