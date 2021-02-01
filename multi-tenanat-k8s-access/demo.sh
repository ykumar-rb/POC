

echo "Cleaning existing namespace, servuice accounts, tenant conetxt"
echo "deleting zero-tenant"
kubectl delete ns zero-tenant-namespace
kubectl delete -f zero-tenant-access.yaml


echo "deleting spike-tenant"
kubectl delete ns spike-tenant-namespace
kubectl delete -f spike-tenant-access.yaml

echo "Creating zero-tenant namespace, sa and RBAC"
kubectl create ns zero-tenant-namespace
kubectl  create -f zero-tenant-access.yaml
./create_k3s_config_with_rbac.sh  zero-tenant-namespace-user zero-tenant-namespace
kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4 -n zero-tenant-namespace



echo "Creating spike-tenant namespace, sa and RBAC"
kubectl create ns spike-tenant-namespace
kubectl  create -f spike-tenant-access.yaml
./create_k3s_config_with_rbac.sh  spike-tenant-namespace-user spike-tenant-namespace
kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4 -n spike-tenant-namespace


sleep 1
echo "Demostarting access control over namespaces for respective tenants"
echo "\n\n##############################################\n\n"
echo "Zero tenant"
KUBECONFIG=/tmp/kube/k8s-zero-tenant-namespace-user-zero-tenant-namespace-conf kubectl get pods
echo "Spike tenant"
KUBECONFIG=/tmp/kube/k8s-spike-tenant-namespace-user-spike-tenant-namespace-conf kubectl get pods
