Setup is done via setting up  Kubeadm -

reference: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
```
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo swapoff -a
sudo kubeadm init
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl version | base64 | tr -d '\n' && kubectl apply -f https://cloud.weave.works/k8s/net?k8s-version=1.9.3-00
kubectl taint nodes --all node-role.kubernetes.io/master-
```

Installation of istio by following below link:

Reference - https://medium.com/better-programming/getting-started-with-istio-on-kubernetes-e582800121ea
Steps required from above link are -
$ curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.5.2 sh -
$ cd istio-1.5.2
$ export PATH=$PWD/bin:$PATH
$ istioctl manifest apply --set profile=demo 
$ kubectl label namespace default istio-injection=enabled

Follow below to practice traffic mirroring.
https://medium.com/better-programming/traffic-mirroring-in-kubernetes-using-istio-dad0976b4e1

Trobleshooting- If facing difficulty ,trigger kubeadm reset  - to cleanup
Try to bringup virtual nginx istio service before nginx service
