Docker 作为 k8s 容器运行时，调用关系如下：
kubelet --> docker shim （在 kubelet 进程中） --> dockerd --> containerd
Containerd 作为 k8s 容器运行时，调用关系如下：
kubelet --> cri plugin（在 containerd 进程中） --> Containerd

Kubernetes 从 v1.20 开始弃用 Docker，并推荐用户切换到基于容器运行时接口（CRI）的容器引擎，如 containerd、cri-o 等。如果你使用了云服务商提供的托管 Kubernetes 服务，那你不用担心，像 GKE、AKS 等云服务商都已经在新版集群中把默认的运行时切换到 containerd。

在几年之前，Docker 公司在容器技术领域强势崛起，一家独大，Google、RedHat 这样的巨头们都产生了很大的危机感，因此他们想与 Docker 公司一起联合研发推进一个开源的容器运行时作为 Docker 技术的核心依赖。然鹅 Docker 公司很高冷的表示：我不干！巨头们听到这个反馈就很不爽啊，因此通过一些手段对 Docker 公司软硬兼施，使其将 libcontainer 捐给了开源社区，也就是现在的 runc，一个 low level 的容器运行时。此外，巨头们又成立了 CNCF 去对抗 Docker 公司的一家独大，CNCF 成立的思路很明确：在容器领域干不过 Docker，那就搞容器上层的建设——容器编排，从此 K8s 诞生了。虽然 Docker 公司也尝试使用 Swarm 去对抗 K8s，但最终也失败了。