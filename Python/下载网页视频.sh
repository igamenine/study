# b站下载视频
# 安装you-get
pip3 install you-get
# 查看网址分辨率源作为--format的参数
you-get -i https://www.bilibili.com/video/BV1Xj421Z7VW/
# 使用方法
you-get --format=[size] -o [out_path] [url]
# 例子
you-get -n --format=flv720 -o /user/download https://www.bilibili.com/video/BV1yD4y1M71B/