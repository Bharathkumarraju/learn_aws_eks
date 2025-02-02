bharathkumardasaraju@day-2$ helm install monitoring prometheus-community/kube-prometheus-stack -f ./custom_kube_prometheus_stack.yml -n monitoring


NAME: monitoring
LAST DEPLOYED: Sun Feb  2 08:11:31 2025
NAMESPACE: monitoring
STATUS: deployed
REVISION: 1
NOTES:
kube-prometheus-stack has been installed. Check its status by running:
  kubectl --namespace monitoring get pods -l "release=monitoring"

Visit https://github.com/prometheus-operator/kube-prometheus for instructions on how to create & configure Alertmanager and Prometheus instances using the Operator.
bharathkumardasaraju@day-2$
bharathkumardasaraju@day-2$


bharathkumardasaraju@10.EKS-prom-stack$ kubectl get nodes
NAME                                             STATUS   ROLES    AGE   VERSION
i-0cd2305a31c9ca77f.eu-west-3.compute.internal   Ready    <none>   33m   v1.30.8-eks-aeac579
i-0df208b264c59a88b.eu-west-3.compute.internal   Ready    <none>   33m   v1.30.8-eks-aeac579
bharathkumardasaraju@10.EKS-prom-stack$ kubectl get pods -n monitoring -l release=monitoring
NAME                                                  READY   STATUS    RESTARTS   AGE
monitoring-kube-prometheus-operator-bf8679fbb-tcz8h   1/1     Running   0          7m55s
monitoring-kube-state-metrics-545974fbd4-zbmzp        1/1     Running   0          7m55s
monitoring-prometheus-node-exporter-pn7jt             1/1     Running   0          7m55s
monitoring-prometheus-node-exporter-qrdn8             1/1     Running   0          7m55s
bharathkumardasaraju@10.EKS-prom-stack$ 


