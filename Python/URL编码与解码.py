import urllib.parse

test = "浙C12345"
print (test)
# urlencode
test01 = urllib.parse.quote(test)
print(test01)
#urldecode
print(urllib.parse.unquote(test01))