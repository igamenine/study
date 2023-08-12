# linux下输入Python命令默认指向的是/usr/bin/python
# 因此，为了方便使用，安装了python3后，我们一般会创建软链接使/usr/bin/python指向/usr/bin/python3。
# 备份系统自带python2的软链接（可不做）：
mv /usr/bin/python /usr/bin/python.bak
# 创建python3软链接：
# （安装python一般会自动生成软链接/usr/bin/python3，如果没有，请将“/usr/bin/python3”改为你安装的python3的位置）
sudo ln -s /usr/bin/python3 /usr/bin/python
# 同理，pip也一样
sudo ln -s /usr/bin/pip3 /usr/bin/pip