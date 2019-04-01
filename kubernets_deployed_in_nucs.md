###  Running Kubernetes on  nucs nodes (1 master and 2 worker) and using laptop as router ###

```

-------------               ________              _________ (192.168.173.2)  
|  Lap top  |-eth0->|lan|  |        |<----------->|_master__|      ___________ (192.168.173.3)  
|           |---eth1------ | swtich |<-------------------------->|_worker 1__|      __________ 
-------------              |________|<-------------------------------------------->|_worker-2_| (192.168.173.4)
      eth1-192.168.173.10         
      
```
### LAPTOP ###
**Laptop eth0 is  on lan , eth2 is private subnet 192.168.173.10 connected to _switch_1_ **
```
sudo iptables -t nat -A POSTROUTING -o enp0s31f6 -j MASQUERADE && \
              sudo iptables -I FORWARD -o eth0 -s 192.168.0.0/16 -j ACCEPT && \ 
              sudo iptables -I INPUT -s 192.168.0.0/16 -j ACCEPT && \
              sudo ifdown eth1 && sudo ifup eth1
```              
              
### NUCS setup  ###
###### Nucs node connected to switch_1 ######
1.Set network
master 192.168.173.2
node1 192.168.173.3
node2 192.168.173.4
Set gateway in ifcfg to laptop 192.168.173.10
###### Network script example  ######
```
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=none
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPADDR=192.168.173.2
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=enp0s20f0u4
DEVICE=enp0s20f0u4
ONBOOT=no
USERCTL=yes
GATEWAY=192.168.173.10
```

```
2. Edit /etc/resolve.conf and copy from your laptop
```

```
3. On all nodes install kubelet and docker.
```

### Installing Master in Nucs ###
1. ssh to master node and run kubeadm init as shown below.
** for flannel to work correctly, you must pass --pod-network-cidr=10.244.0.0/16 to kubeadm init.**
```
kubeadm init --cri-socket="/var/run/dockershim.sock" --pod-network-cidr=10.244.0.0/16
~~ kubeadm init --cri-socket="/var/run/crio/crio.sock"  --pod-network-cidr=10.244.0.0/16 ~~
```
2.Check nodes are running 
```
To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
```
kubectl get nodes
NAME          STATUS   ROLES    AGE    VERSION
kube-master   NotReady    master   151m   v1.14.0
```
3. Install flannel cni
```
Set /proc/sys/net/bridge/bridge-nf-call-iptables to 1 by running sysctl net.bridge.bridge-nf-call-iptables=1 
```
to pass bridged IPv4 traffic to iptables’ chains. This is a requirement for some CNI plugins to work, 
for more information please see here. https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/#network-plugin-requirements
For any error check this link to troubleshoot
https://kubernetes.io/docs/setup/independent/troubleshooting-kubeadm/


```
kubectl -n kube-system apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml
Once a pod network has been installed, you can confirm that it is working by checking that the CoreDNS pod is Running in the output of kubectl get pods --all-namespaces. And once the CoreDNS pod is up and running, you can continue by joining your nodes
```
###### To avoid cgroups error ######
```
edit vi /etc/systemd/system/kubelet.service.d/11-cgroups.conf
and add following line
[Service]
CPUAccounting=true
MemoryAccounting=true
systemctl daemon-reload
systemctl restart kubelet
```

### Join worker nodes , ###
###### login to each node and run join commands. Join command is presented after master is created, or you can get one as shown below. ######
[ preflight check , install kubelet and docker]
```
echo 1 > /proc/sys/net/ipv4/ip_forward
[copy this from master nodes, if token is not found use this command to list token:- kubeadm token list ]
[initial token expires in 24 hours, you can create, never expire token using this command:- kubeadm token create --ttl=0 --print-join-command]

kubeadm join 192.168.173.5:6443 --token q8cxif.3eeaa5sfwqlnjthk     --discovery-token-ca-cert-hash sha256:8a6b0b2782bbf1bb87a28c226c131676c3f10ea8edcf40867e6316eb281af82f
```
Optional, to add label to worker node
```
kubectl label node  kube-node-1 node-role.kubernetes.io/worker=worker
```
