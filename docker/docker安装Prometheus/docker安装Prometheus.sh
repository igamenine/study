# 1、创建宿主机配置文件挂载目录
mkdir /etc/prometheus
# 2、将当前目录配置文件上传至挂载目录中，然后为grafana-storage目录赋权
rz
chmod 777 grafana-storage
# 3、如果有防火墙，开启如下端口
9090 9091 9093 3000 8080 9100 3306 9104 1521 9161
# 4、执行docker-compose命令启动服务
# 注意：yml文件中默认pull了mysql、Oracle用于exporter的测试，如果你有自己的数据库要监控可以删除，其他诸如cadvisor、pushgateway等容器也一样，可以根据需要删改
docker-compose up -d
# 5、检查各服务启动情况，如果有服务异常则使用logs检查
docker-compose ps
# 6、输入IP:3000打开grafana配置Prometheus源
# 左下角齿轮-preference-data sources-add data source-prometheus-输入url-save&test
# 7、导入当前目录下json大屏配置文件测试，大屏内容均由显示即表示部署成功
左上角田字图-Import-Updaload JSON file-grafana/node-manager-aliyun_rev1.json-prometheus(default)-Import
左上角田字图-Import-Updaload JSON file-grafana/mysql-panorama_rev1.json-prometheus(default)-Import
# 7、测试成功后就可以自定义配置导入大屏json文件使用了
左上角田字图-Import-Updaload JSON file-grafana/oracledb_rev1.json-prometheus(default)-Import
# 注：为了避免任何形式的时区混淆，特别是当涉及所谓的夏令时时时，Prometheus决定在内部仅使用Unix时间和UTC用于Prometheus所有组件的显示目的，所以不需要统一监控工具的时区。
# 部署成功请参考http://43.142.25.174:9090/targets?search=，可自行更改端口查看各服务运行状况