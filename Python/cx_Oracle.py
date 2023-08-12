# cx_Oracle是python中连接并使用Oracle数据库的依赖包
# 在线安装方式
# pip3 install cx_Oracle
# 离线安装方式
# 推荐使用docker打包安装，不然待补充
import os
import cx_Oracle
# 连接数据库
class sms(object):
    def __init__(self):
        # 初始化连接
        self.hxkdb = cx_Oracle.connect('igamenine/igamenine@//127.0.0.1:1521/orcl', encoding="UTF-8", nencoding="UTF-8")

    def db_oracle_connect(self):
        # 声明连接
        src_db = self.hxkdb
        # 建立连接游标(执行语句必做)
        src_db_cursor = src_db.cursor()
        # 定义参数
        code = '张三'
        # code = ['张三', '李四']
        # code = [
        #     ('张三', 18, 170), 
        #     ('李四', 20, 175)
        # ]
        # 拼接查询sql语句
        sql = "select z, x, y from test_py1 where z = '{}'".format(code)
        print(sql)
        # 执行sql语句
        src_db_cursor.execute(sql)
        # 提交执行记录
        src_db.commit()
        # 存储执行返回记录
        src_data = src_db_cursor.fetchall()
        # 拼接插入sql语句
        sql = "insert into test_py2 values(:z, :x, :y)"
        print(sql)
        # 执行sql语句
        src_db_cursor.execute(sql, src_data)
        # 提交执行记录
        src_db.commit()
        # 关闭游标
        src_db_cursor.close()
        # 关闭连接
        src_db.close()


if __name__ == '__main__':
    # try:
        sms().db_oracle_connect()
    # except cx_Oracle.DatabaseError as e:
    #     print(os.path.basename(__file__) + "{}".format(e))
    # except:
    #     print("异常" + os.path.basename(__file__))