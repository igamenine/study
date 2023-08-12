# 拉取官方python镜像
docker pull python
# 启动python容器
docker run -itd --name python -v "$PWD":/usr/src/myapp -w /usr/src/myapp python:latest
# 单独执行python脚本
docker run -it --rm --name python -v "$PWD":/usr/src/myapp -w /usr/src/myapp python:latest python helloworld.py