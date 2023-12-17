# 查看kubernetes版本
kubectl version
# 用的最多的就是kubectl get，参见http://docs.kubernetes.org.cn/626.html
# 查看节点状态
kubectl get node
# NAME      STATUS    ROLES         AGE VERSION
# minikube  ready control-place 29s v1.25.2
# 查看所有pod运行状态
# 其中的READY指的是pod中有几个除pause以外的容器
kubectl get pod -A
# NAMESPACE NAME  READY STATUS  RESTARTS  AGE
# default   npod  3/3   Running 2         365d
# 查看default中的pod状态
kubectl get pod
kubectl get pods
# NAME  READY STATUS  RESTARTS  AGE
# npod  3/3   Running 2         365d
# 查看指定ns的pod状态 -n可以用在其他有ns的对象上。
kubetcl get pod -n kubeapps
# 查看所有不同资源对象
# 注：pod部分仅展示default组，想确认pod请使用get pod -A
kubectl get all
# 查看replication controllers和service信息
kubectl get rc,services
# pod名称格式
# [pod_name]-[replicaset_id]-[pod_id]如nginx-xxxxxxxxxx-xxxxxx
# 为pod添加容器（如果pod不存在则会自动创建），这种方法只能创建1个副本
kubectl run [pod_name] --image=[image:version] [-n=namespace_name]
kubectl run mynginx --image=nginx:1.22
# 运行临时pod，它会再创建的同时进入pod，你exit后便自动删除
kubectl run [pod_name] --image=[image:version] -it --rm
# 删除pod
# 注意如果pod是通过deployment创建的则会自动重建被删除的pod（pod_id改变），这通常用来自动重启pod
# 单独使用命令创建的pod，使用该命令会直接删除，需要手动run创建
# 删除pod需要等待kubernetes清理pod占用资源，所以可能比较慢，对于臃肿的pod可以使用--force -–grace-period=0将优雅退出时间设置为0
kubectl delete pod [pod_name]
kubectl delete pod [pod_name] --force -–grace-period=0
# 查看pod日志
kubectl logs -f [pod_name]
kubectl logs -f mynginx
# 查看pod属性
# 可以检查Containers参数查看其使用到的容器信息
kubectl describe pod [pod_name]
# 查看node属性
kubectl describe node [node_name]
# 查看default中的pod节点信息
# -owide 详细信息，通用参数建议想要更详细的信息都添加用用看
kubectl get pod -owide
kubcetl get pods -owide
# 进入pod 它会进入pod的第一个容器
# 注意：结尾不加 -- 也可以，但是是被抛弃的用法，今后的版本会被删除
kubectl exec -it [pod_name] [-n namespace -c container] -- bash
# 进入pod中的指定container 当pod有多个容器时，需要单独指定容器进入
kubectl exec -it [pod_name] -c [container_name] -- bash
# 创建deployment，会自动生成replicaSet的hashid，它会根据replica_num创建对应的pod数量，这种方法会创建多个副本
# 使用该命令后会生成1个Deployment，1个replicaSet，replica_num个pod
kubectl create deployment [deployment_name] --image=[imgae:version] --replicas=[replica_num]
# 查看deployment状态
kubectl get deploy
# NAME    READY UP-TO-DATE  AVAILABLE AGE
# ndeploy  3/3   3           3         33s
# 查看default中的deployment节点信息，比如使用的镜像版本及所在容器等
kubectl get deploy --owide
# 打开default中yaml标记的节点信息
kubectl get deploy -o yaml | grep "image:"
# 例子：查询指定namespace中的镜像版本信息
kubectl get deploy -o yaml -n ddp-zeppelin|grep "image:"
# NAME    READY UP-TO-DATE  AVAILABLE AGE CONTAINERS  IMAGES      SELECTOR
# ndeploy  3/3   3           3         33s nginx       nginx:1.22  app=ndeploy
# 查看replicaSet
kubectl get replicaSet
kubectl get rs
# NAME                DESIRED CURRENT READY AGE
# ndeploy-xxxxxxxxxx  3       3       3     33s
# 实时返回replicaSet状态
kubectl get replicaSet --watch
kubectl get rs --watch
# 扩缩deployment副本
# --replicas=0时，下线所有pod
kubectl scale deploy [deployment_name] --replicas=[new_num]
# 自动扩缩deployment副本
kubectl autoscale deployment/[deployment_name] --min=[min_num] --max=[max_num] --cpu-percent=[percent_num]
# 例kubectl autoscale deployment/nginx-auto --min=3 --max=10 --cpu-percent=75
# 查看自动扩缩
kubectl get hpa
# 删除自动扩缩
kubectl delete hpa [deployment_name]
# 更新镜像
# 注意：更新镜像本质上创建了新的replicaSet代替老的，老的不要删回滚中版本号要用到
kubectl set image deploy/[deployment_name] [CONTAINERS]=[image:version]
# 例kubectl set image deploy/ndeploy nginx=nginx:1.23
# 查看历史版本修订数deployment
kubectl rollout history deploy/[deployment_name]
# 查看历史版本详细信息
kubectl rollout history deploy/[deployment_name] --revision=[revision_id]
# 回滚deployment
kubectl rollout undo deploy/[deployment_name] --to-revision=[revision_id]
# deployment映射出service，这样集群内所有pod都可以访问自己了
kubectl expose deploy/[deployment_name] --name=[service_name]  [--port=[port] --target-port=[target_port] [--type=NodePort/CluserIP/LoadBalancer...]]
# 公开deployment中的端口，port为外部访问端口，target-port为内部实际端口，生成后默认的CLUSTER-IP为集群内部ip，仅供集群内部pod之间通信使用
kubectl expose deploy/[deployment_name] --name=[service_name]  --port=[port] --target-port=[target_port]
# 查看service信息
kubectl get service
# NAME      TYPE      CLUSTER-IP    EXTERNAL-IP PORT(S)   AGE
# nservice  ClusterIP 10.43.228.137 <none>      8080/TCP  6s
# consul    NodePort  10.43.228.104 <none>      8500:30095/TCP
# 查看service属性
kubectl describe service [service_name]
# 查看命名空间
kubectl get namespace
# 查看lease对象
kubectl get lease -A
# 创建命名空间
kubectl create ns [namespace_name]
# 修改默认命名空间
kubectl config set-context $(kubectl config current-context) --namespace=[new_namespace_name]
# 删除命名空间
# 注：会清空命名空间下的所有资源，删除之前会对资源进行检查，如果有异常资源则不会执行删除操作
kubectl delete ns [namespace_name]
# 删除指定命名空间所有资源
kubectl delete all -all -n=[namespace_name]
# 删除所有资源
kubectl delete all -all
kubectl delete all -A
# 根据yaml应用/更新资源，如果资源不存在则会创建
kubectl apply -f [yaml_name]
# 根据yaml删除资源
kubectl delete -f [yaml_name]
# 查看pod的标签
kubectl get pod --show-labels
# 查询时筛选标签
kubectl get pod -l "[labels1,labels2,label3...]"
# kubectl get pod -l "app=nginx,environment=production"
# 代替docker的命令crictl
# 持参数和docker基本一致，不过无法导入导出镜像
# 查看镜像
crictl images
# 查看容器
crictl ps
# 更多命令参见《docker基础命令》
# 导入镜像
# --platform 填写系统架构信息，用arch查看，一般是amd64
# -n 填写镜像命名空间，一般时k8s.io
ctr -n k8s.io images import [export_name].tar[.gz] --platform linux/amd64
# 导出镜像
ctr -n k8s.io images export [export_name].tar[.gz] [image] --platform linux/amd64
# 查看configmap内容
kubectl describe cm [configmap_name]
# 修改configmap内容 修改工具支持vi命令
kubectl edit cm [configmap_name]
# 查看secret内容
# 如果secret被环境变量使用，secret修改后需要重启pod手动更新配置
kubectl describe secret/[pod_name]
# 查看临时卷
kubectl get ev
# 查看持久卷
kubectl get pv
# 查看持久卷声明
kubectl get pvc
# 查看存储类
kubectl get sc
# 将本地端口的连接转发给容器 port主机端口 target-port容器端口 local_ip当主机有多个外网IP时指定IP
kubectl port-forward pods/[pod_name] [local_ip] [port]:[target-port]
# 查看Ingress，kubenetes的nginx
kubectl get ingress
# 查看ingress配置路由地址/域名
kubectl describe ingress [ingress_name]
# 其中会有一个Rules记录Host即为用户可访问的路由地址
# pod内重启服务
gorp restart-service
# 查看停止的pod进程
kubectl get pod -A|grep 0/
kubectl get pod -A|grep 0/|grep [pod_name]
# 查看pod占用资源
kubectl top pod [pod_name]
kubectl top pod -n [namespace_name] [pod_name]
# 输出指定信息 -o
kubectl get -o [json/yaml/name/custom-columns=/custom-columes-file=/go-template=/go-template-file=/jsonpath=/jsonpath-file=/...]
# 输出pod名称
kubectl get -o name [-n namespace_name]
# 查看node情况
kubectl get node
kubectl get node -owide
kubectl get node -n [namespace_name] 
# 输出pod_name与pod_uid的对应关系，可以配合grep筛选结果
kubectl get pod -A -o custom-columns=NodeName:.spec.nodeName,NameSpace:.metadata.namespace,PodName:.metadata.name,PodUID:.metadata.uid 
kubectl get pod -A -o custom-columns=NodeName:.spec.nodeName,NameSpace:.metadata.namespace,PodName:.metadata.name,PodUID:.metadata.uid |grep [pod_uid]

# 查看token(以k3s的路径作为例子)
cat /var/lib/rancher/k3s/server/node-token
# 配置镜像加速
# k3s配置镜像加速在/etc/rancher/k3s/registries.yaml并且要在每个Node都创建一个
vim /etc/containerd/config.toml
# 添加以下内容
mirrors:
  docker.io:
    endpoint:
      - "https://fsp2sfpr.mirror.aliyuncs.com/"
# 修改完成后重启Node组件
systemctl restart kubelet.service

##### Helm #####
# 建立helm仓库
helm repo add [repo_name] [repo_url]
# helm repo add bitnami https://charts.bitnami.com/bitnami
# 通过helm部署release
helm install [release_name] [chart_name] --version [version]
helm install [release_name] -f [yaml] [chart_name]
# helm install my-mysql bitnami/mysql --version 9.4.4
# helm install my-mysql --set-string auth.rootPassword=123456 --set primary.persistence.size=2Gi bitnami/mysql
# 查看release配置信息
helm get values [release_name]
# 删除release
helm delete [release_name]
# Helm安装Mysql主从集群，配置请参考当前目录helm_mysql_values.yaml
helm install cluster -f helm_mysql_values.yaml bitnami/mysql
# -f/-values 使用YAML文件覆盖默认配置，可以指定多次，优先使用最后边的文件。
# --set 通过命令行的方式对指定项进行覆盖。
# 如果同时使用两种方式，则--set中的值会被合并到-f中，但是--set中的值优先级更高。
