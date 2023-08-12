# // 往/etc/docker/daemon.json替换程以下内容，或者直接本地创建一个daemon.json替换掉他
{
    "log-driver":"json-file",
    "log-opts":{ "max-size" :"1g","max-file":"2"},
    "registry-mirrors": [
        "https://mirror.ccs.tencentyun.com"
    ]
}

# // 刷新配置文件
systemctl  daemon-reload
# // 重启docker
systemctl  restart docker
# // 查看容器配置文件是否已默认添加，能查到就代表成功
docker inspect mysql|grep 'max-size'

# 图文参考https://www.jianshu.com/p/5f4c15eef9ad?from=groupmessage&u_atoken=58c5f691-02ab-4c8a-a532-8e02e7388fa2