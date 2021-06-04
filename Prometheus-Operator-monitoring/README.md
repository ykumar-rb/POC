
## Create Kubernetes Operator crd and POD:

`
  kubectl create ns monitoring
`

`
  kubectl  create -f -n monitoring Prometheus-Operator-monitoring/prometheus-operator
`




## Create Kubernetes Instance and Sample service monitors

`
  kubectl create ns apps
`

` 
  kubectl create -f Prometheus-Operator-monitoring/prometheus-cluster-monitoring -n monitoring
`

# Create Service monitor in app namespace
`
  kubectl create -f Prometheus-Operator-monitoring/Prometheus-Operator-monitoring/node-exporter-apps
`


# Expose Prometheus UI on host machine to view on browser
`
  kubectl -n monitoring  port-forward --address 172.29.55.252 prometheus-k8s-0 9090
`

# Create Grafana in monitoring  namespace
`
  kubectl create -f Prometheus-Operator-monitoring/grafana -n monitoring
`
# Expose Grafana UI on host machine to view on browser
`
  kubectl -n monitoring  port-forward --address 172.29.55.252 <grafana-pod-id> 3000
`
`
  Grafana UI creds are admin/admin
`
