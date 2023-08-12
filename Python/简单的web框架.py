# 转自https://blog.csdn.net/freeking101/article/details/53020865#
# web.py依赖安装地址https://webpy.org/install.zh-cn
import web
 
urls = (
    '/(.*)', 'hello'
)
 
app = web.application(urls, globals())
 
class hello:
    def GET(self, name):
        i = web.input(times=1)
        if not name: 
            name = 'world'
        for c in xrange(int(i.times)): 
            print 'Hello,', name+'!'
        return 'Hello, ' + name + '!'
 
if __name__ == "__main__":
    app.run()