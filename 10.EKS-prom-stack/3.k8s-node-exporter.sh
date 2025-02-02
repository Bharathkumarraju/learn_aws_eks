bharathkumardasaraju@learn_aws_eks$ kubectl get svc -n monitoring -o wide| grep -i node
monitoring-prometheus-node-exporter       ClusterIP   10.100.207.124   <none>        9100/TCP                     81m   app.kubernetes.io/instance=monitoring,app.kubernetes.io/name=prometheus-node-exporter
bharathkumardasaraju@learn_aws_eks$ kubectl get svc -n monitoring -o wide| grep -i kube-state
monitoring-kube-state-metrics             ClusterIP   10.100.162.202   <none>        8080/TCP                     81m   app.kubernetes.io/instance=monitoring,app.kubernetes.io/name=kube-state-metrics
bharathkumardasaraju@learn_aws_eks$ 


root@i-0df208b264c59a88b bin]# curl 10.100.207.124:9100/metrics
# HELP go_gc_duration_seconds A summary of the pause duration of garbage collection cycles.
# TYPE go_gc_duration_seconds summary
go_gc_duration_seconds{quantile="0"} 1.7153e-05
go_gc_duration_seconds{quantile="0.25"} 3.9567e-05
go_gc_duration_seconds{quantile="0.5"} 4.4767e-05
go_gc_duration_seconds{quantile="0.75"} 5.6816e-05
go_gc_duration_seconds{quantile="1"} 0.001738216
go_gc_duration_seconds_sum 0.012789747
go_gc_duration_seconds_count 151
# HELP go_goroutines Number of goroutines that currently exist.
# TYPE go_goroutines gauge
go_goroutines 8
# HELP go_info Information about the Go environment.
# TYPE go_info gauge
go_info{version="go1.22.5"} 1
# HELP go_memstats_alloc_bytes Number of bytes allocated and still in use.
# TYPE go_memstats_alloc_bytes gauge
go_memstats_alloc_bytes 2.786472e+06
# HELP go_memstats_alloc_bytes_total Total number of bytes allocated, even if freed.
# TYPE go_memstats_alloc_bytes_total counter
go_memstats_alloc_bytes_total 2.75234456e+08
# HELP go_memstats_buck_hash_sys_bytes Number of bytes used by the profiling bucket hash table.
# TYPE go_memstats_buck_hash_sys_bytes gauge
go_memstats_buck_hash_sys_bytes 1.514372e+06
# HELP go_memstats_frees_total Total number of frees.
# TYPE go_memstats_frees_total counter
go_memstats_frees_total 3.481327e+06
# HELP go_memstats_gc_sys_bytes Number of bytes used for garbage collection system metadata.
# TYPE go_memstats_gc_sys_bytes gauge
go_memstats_gc_sys_bytes 3.270432e+06
# HELP go_memstats_heap_alloc_bytes Number of heap bytes allocated and still in use.
# TYPE go_memstats_heap_alloc_bytes gauge
go_memstats_heap_alloc_bytes 2.786472e+06
# HELP go_memstats_heap_idle_bytes Number of heap bytes waiting to be used.
# TYPE go_memstats_heap_idle_bytes gauge
go_memstats_heap_idle_bytes 3.817472e+06
# HELP go_memstats_heap_inuse_bytes Number of heap bytes that are in use.
# TYPE go_memstats_heap_inuse_bytes gauge
go_memstats_heap_inuse_bytes 4.128768e+06
# HELP go_memstats_heap_objects Number of allocated objects.
# TYPE go_memstats_heap_objects gauge
go_memstats_heap_objects 21238
root@i-0df208b264c59a88b bin]#

root@i-0df208b264c59a88b bin]# curl 10.100.162.202:8080/metrics
# HELP kube_certificatesigningrequest_annotations Kubernetes annotations converted to Prometheus labels.
# TYPE kube_certificatesigningrequest_annotations gauge
# HELP kube_certificatesigningrequest_labels [STABLE] Kubernetes labels converted to Prometheus labels.
# TYPE kube_certificatesigningrequest_labels gauge
# HELP kube_certificatesigningrequest_created [STABLE] Unix creation timestamp
# TYPE kube_certificatesigningrequest_created gauge
kube_certificatesigningrequest_created{certificatesigningrequest="csr-l9f4h",signer_name="kubernetes.io/kubelet-serving"} 1.738453553e+09
kube_certificatesigningrequest_created{certificatesigningrequest="csr-xc2t5",signer_name="kubernetes.io/kubelet-serving"} 1.738453553e+09
# HELP kube_certificatesigningrequest_condition [STABLE] The number of each certificatesigningrequest condition
# TYPE kube_certificatesigningrequest_condition gauge
kube_certificatesigningrequest_condition{certificatesigningrequest="csr-l9f4h",signer_name="kubernetes.io/kubelet-serving",condition="approved"} 1
kube_certificatesigningrequest_condition{certificatesigningrequest="csr-l9f4h",signer_name="kubernetes.io/kubelet-serving",condition="denied"} 0
kube_certificatesigningrequest_condition{certificatesigningrequest="csr-xc2t5",signer_name="kubernetes.io/kubelet-serving",condition="approved"} 1
kube_certificatesigningrequest_condition{certificatesigningrequest="csr-xc2t5",signer_name="kubernetes.io/kubelet-serving",condition="denied"} 0
# HELP kube_certificatesigningrequest_cert_length [STABLE] Length of the issued cert
# TYPE kube_certificatesigningrequest_cert_length gauge
kube_certificatesigningrequest_cert_length{certificatesigningrequest="csr-l9f4h",signer_name="kubernetes.io/kubelet-serving"} 1074
kube_certificatesigningrequest_cert_length{certificatesigningrequest="csr-xc2t5",signer_name="kubernetes.io/kubelet-serving"} 1074
# HELP kube_configmap_annotations Kubernetes annotations converted to Prometheus labels.
# TYPE kube_configmap_annotations gauge
# HELP kube_configmap_labels [STABLE] Kubernetes labels converted to Prometheus labels.
# TYPE kube_configmap_labels gauge
# HELP kube_configmap_info [STABLE] Information about configmap.
# TYPE kube_configmap_info gauge
kube_configmap_info{namespace="monitoring",configmap="monitoring-kube-prometheus-alertmanager-overview"} 1
kube_configmap_info{namespace="monitoring",configmap="monitoring-kube-prometheus-controller-manager"} 1
kube_configmap_info{namespace="monitoring",configmap="monitoring-kube-prometheus-k8s-resources-node"} 1
kube_configmap_info{namespace="monitoring",configmap="monitoring-kube-prometheus-namespace-by-pod"} 1
kube_configmap_info{namespace="monitoring",configmap="monitoring-kube-prometheus-namespace-by-workload"} 1
kube_configmap_info{namespace="monitoring",configmap="monitoring-kube-prometheus-proxy"} 1
kube_configmap_info{namespace="monitoring",configmap="monitoring-kube-prometheus-scheduler"} 1
kube_configmap_info{namespace="default",configmap="kube-root-ca.crt"} 1
kube_configmap_info{namespace="kube-system",configmap="aws-auth"} 1
kube_configmap_info{namespace="monitoring",configmap="monitoring-kube-prometheus-grafana-overview"} 1
kube_configmap_info{namespace="kube-system",configmap="amazon-vpc-cni"} 1
kube_configmap_info{namespace="kube-system",configmap="kube-apiserver-legacy-service-account-token-tracking"} 1
kube_configmap_info{namespace="kube-system",configmap="kube-proxy"} 1
kube_configmap_info{namespace="kube-system",configmap="kube-root-ca.crt"} 1
root@i-0df208b264c59a88b bin]#


[root@i-0df208b264c59a88b bin]# hostname
i-0df208b264c59a88b.eu-west-3.compute.internal
[root@i-0df208b264c59a88b bin]# cat /etc/*release*
NAME="Amazon Linux"
VERSION="2"
ID="amzn"
ID_LIKE="centos rhel fedora"
VERSION_ID="2"
PRETTY_NAME="Amazon Linux 2"
ANSI_COLOR="0;33"
CPE_NAME="cpe:2.3:o:amazon:amazon_linux:2"
HOME_URL="https://amazonlinux.com/"
SUPPORT_END="2025-06-30"
Amazon Linux release 2 (Karoo)
cpe:2.3:o:amazon:amazon_linux:2
[root@i-0df208b264c59a88b bin]#






bharathkumardasaraju@learn_aws_eks$ kubectl get svc -n monitoring -o wide| grep -i node
monitoring-prometheus-node-exporter       ClusterIP   10.100.207.124   <none>        9100/TCP                     81m   app.kubernetes.io/instance=monitoring,app.kubernetes.io/name=prometheus-node-exporter
bharathkumardasaraju@learn_aws_eks$ kubectl get svc -n monitoring -o wide| grep -i kube-state
monitoring-kube-state-metrics             ClusterIP   10.100.162.202   <none>        8080/TCP                     81m   app.kubernetes.io/instance=monitoring,app.kubernetes.io/name=kube-state-metrics
bharathkumardasaraju@learn_aws_eks$ 


bharathkumardasaraju@learn_aws_eks$ aws eks describe-cluster --name bharath-cluster --query "cluster.kubernetesNetworkConfig.serviceIpv4Cidr" --output text

10.100.0.0/16
bharathkumardasaraju@learn_aws_eks$ 