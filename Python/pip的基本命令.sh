# Windows下pip3一般不需要改变，但linux系统下如今的pip3一般以pip33示人，所以我将以pip33为准书写命令
# 查看是否已经安装 pip3 可以使用以下命令：
pip3 --version
# 安装包
pip3 install xlrd
pip3 install xlrd==1.2.0 #指定安装版本
# 卸载包：
pip3 uninstall numpy
# 查看包
pip3 list
pip3 list -o #列出可更新模块
# 更新包
pip3 install -U pip
pip3 install --upgrade SomePackage
# 搜索包
pip3 search SomePackage
# 查看包信息
pip3 show -f SomePackage
# 临时使用国内源
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple Django

# 永久使用国内源方法
# 1、在~目录下创建.pip目录；
# 2、在~/.pip目录下创建pip.conf并配置国内源；
# 3、使用命令检测是否配置成功，成功后则永久使用。
mkdir ~/.pip

vim ~/.pip/pip.conf
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
[install]
trusted-host = https://pypi.tuna.tsinghua.edu.cn

pip3 config list  

# 中国科学技术大学 : https://pypi.mirrors.ustc.edu.cn/simple
# 豆瓣：http://pypi.douban.com/simple/