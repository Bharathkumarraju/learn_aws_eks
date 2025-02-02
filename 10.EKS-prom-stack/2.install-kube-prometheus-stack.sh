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


bharathkumardasaraju@learn_aws_eks$ kubectl get svc -n monitoring
NAME                                      TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
alertmanager-operated                     ClusterIP   None             <none>        9093/TCP,9094/TCP,9094/UDP   14m
monitoring-grafana                        ClusterIP   10.100.60.244    <none>        80/TCP                       14m
monitoring-kube-prometheus-alertmanager   ClusterIP   10.100.91.134    <none>        9093/TCP,8080/TCP            14m
monitoring-kube-prometheus-operator       ClusterIP   10.100.45.202    <none>        443/TCP                      14m
monitoring-kube-prometheus-prometheus     ClusterIP   10.100.55.140    <none>        9090/TCP,8080/TCP            14m
monitoring-kube-state-metrics             ClusterIP   10.100.162.202   <none>        8080/TCP                     14m
monitoring-prometheus-node-exporter       ClusterIP   10.100.207.124   <none>        9100/TCP                     14m
prometheus-operated                       ClusterIP   None             <none>        9090/TCP                     14m
bharathkumardasaraju@learn_aws_eks$ 



bharathkumardasaraju@learn_aws_eks$ kubectl get pods -n monitoring
NAME                                                     READY   STATUS    RESTARTS   AGE
alertmanager-monitoring-kube-prometheus-alertmanager-0   2/2     Running   0          14m
alertmanager-monitoring-kube-prometheus-alertmanager-1   2/2     Running   0          14m
monitoring-grafana-5bc784d8dd-447kh                      3/3     Running   0          14m
monitoring-kube-prometheus-operator-bf8679fbb-tcz8h      1/1     Running   0          14m
monitoring-kube-state-metrics-545974fbd4-zbmzp           1/1     Running   0          14m
monitoring-prometheus-node-exporter-pn7jt                1/1     Running   0          14m
monitoring-prometheus-node-exporter-qrdn8                1/1     Running   0          14m
prometheus-monitoring-kube-prometheus-prometheus-0       2/2     Running   0          14m
bharathkumardasaraju@learn_aws_eks$ 



bharathkumardasaraju@learn_aws_eks$ kubectl port-forward service/prometheus-operated -n monitoring 9090:9090
Forwarding from 127.0.0.1:9090 -> 9090
Forwarding from [::1]:9090 -> 9090
Handling connection for 9090
Handling connection for 9090
Handling connection for 9090
Handling connection for 9090
Handling connection for 9090


bharathkumardasaraju@learn_aws_eks$ kubectl port-forward service/monitoring-grafana -n monitoring 8080:80
Forwarding from 127.0.0.1:8080 -> 3000
Forwarding from [::1]:8080 -> 3000


bharathkumardasaraju@learn_aws_eks$ kubectl port-forward service/alertmanager-operated -n monitoring 9093:9093
Forwarding from 127.0.0.1:9093 -> 9093
Forwarding from [::1]:9093 -> 9093




bharathkumardasaraju@learn_aws_eks$ kubectl get servicemonitors.monitoring.coreos.com  -n monitoring
NAME                                                 AGE
monitoring-grafana                                   25m
monitoring-kube-prometheus-alertmanager              25m
monitoring-kube-prometheus-apiserver                 25m
monitoring-kube-prometheus-coredns                   25m
monitoring-kube-prometheus-kube-controller-manager   25m
monitoring-kube-prometheus-kube-etcd                 25m
monitoring-kube-prometheus-kube-proxy                25m
monitoring-kube-prometheus-kube-scheduler            25m
monitoring-kube-prometheus-kubelet                   25m
monitoring-kube-prometheus-operator                  25m
monitoring-kube-prometheus-prometheus                25m
monitoring-kube-state-metrics                        25m
monitoring-prometheus-node-exporter                  25m
bharathkumardasaraju@learn_aws_eks$ kubectl get servicemonitors.monitoring.coreos.com monitoring-grafana  -n monitoring -o
 yaml
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  annotations:
    meta.helm.sh/release-name: monitoring
    meta.helm.sh/release-namespace: monitoring
  creationTimestamp: "2025-02-02T00:12:16Z"
  generation: 1
  labels:
    app.kubernetes.io/instance: monitoring
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: grafana
    app.kubernetes.io/version: 11.3.0
    helm.sh/chart: grafana-8.5.12
  name: monitoring-grafana
  namespace: monitoring
  resourceVersion: "7588"
  uid: 6f535501-3e37-4cb5-82c4-536f09df8011
spec:
  endpoints:
  - honorLabels: true
    path: /metrics
    port: http-web
    scheme: http
    scrapeTimeout: 30s
  jobLabel: monitoring
  namespaceSelector:
    matchNames:
    - monitoring
  selector:
    matchLabels:
      app.kubernetes.io/instance: monitoring
      app.kubernetes.io/name: grafana
bharathkumardasaraju@learn_aws_eks$ 


bharathkumardasaraju@learn_aws_eks$ aws eks describe-cluster --name bharath-cluster --query "cluster.kubernetesNetworkConfig.serviceIpv4Cidr" --output text

10.100.0.0/16
bharathkumardasaraju@learn_aws_eks$ 

