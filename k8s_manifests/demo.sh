bharathkumardasaraju@k8s_manifests$ kubectl apply -f app1.yaml -f app2.yaml
deployment.apps/app1 created
service/app1 unchanged
deployment.apps/app2 created
service/app2 unchanged
bharathkumardasaraju@k8s_manifests$ kubectl get all -o wide
NAME                        READY   STATUS    RESTARTS   AGE   IP                NODE                                             NOMINATED NODE   READINESS GATES
pod/app1-6bbb5b5f84-mjwjf   1/1     Running   0          11s   192.168.190.241   i-00b6efdab721276a7.eu-west-2.compute.internal   <none>           <none>
pod/app2-745ccb95df-qgknr   1/1     Running   0          9s    192.168.106.17    i-0ffa54f6cb76122e1.eu-west-2.compute.internal   <none>           <none>
pod/nginx                   1/1     Running   0          55m   192.168.122.238   i-0ffa54f6cb76122e1.eu-west-2.compute.internal   <none>           <none>
pod/nginx1                  1/1     Running   0          54m   192.168.178.95    i-00b6efdab721276a7.eu-west-2.compute.internal   <none>           <none>

NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE     SELECTOR
service/app1         ClusterIP   10.100.214.2     <none>        80/TCP    5m50s   app=1
service/app2         ClusterIP   10.100.235.176   <none>        80/TCP    5m49s   app=2
service/kubernetes   ClusterIP   10.100.0.1       <none>        443/TCP   113m    <none>

NAME                   READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS   IMAGES   SELECTOR
deployment.apps/app1   1/1     1            1           12s   nginx        nginx    app=1
deployment.apps/app2   1/1     1            1           10s   nginx        nginx    app=2

NAME                              DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES   SELECTOR
replicaset.apps/app1-6bbb5b5f84   1         1         1       12s   nginx        nginx    app=1,pod-template-hash=6bbb5b5f84
replicaset.apps/app2-745ccb95df   1         1         1       10s   nginx        nginx    app=2,pod-template-hash=745ccb95df
bharathkumardasaraju@k8s_manifests$ kubectl delete pod/nginx
pod "nginx" deleted
bharathkumardasaraju@k8s_manifests$ kubectl delete pod/nginx1
pod "nginx1" deleted
bharathkumardasaraju@k8s_manifests$ kubectl get all -o wide
NAME                        READY   STATUS    RESTARTS   AGE   IP                NODE                                             NOMINATED NODE   READINESS GATES
pod/app1-6bbb5b5f84-mjwjf   1/1     Running   0          44s   192.168.190.241   i-00b6efdab721276a7.eu-west-2.compute.internal   <none>           <none>
pod/app2-745ccb95df-qgknr   1/1     Running   0          42s   192.168.106.17    i-0ffa54f6cb76122e1.eu-west-2.compute.internal   <none>           <none>

NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE     SELECTOR
service/app1         ClusterIP   10.100.214.2     <none>        80/TCP    6m23s   app=1
service/app2         ClusterIP   10.100.235.176   <none>        80/TCP    6m22s   app=2
service/kubernetes   ClusterIP   10.100.0.1       <none>        443/TCP   113m    <none>

NAME                   READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS   IMAGES   SELECTOR
deployment.apps/app1   1/1     1            1           44s   nginx        nginx    app=1
deployment.apps/app2   1/1     1            1           42s   nginx        nginx    app=2

NAME                              DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES   SELECTOR
replicaset.apps/app1-6bbb5b5f84   1         1         1       45s   nginx        nginx    app=1,pod-template-hash=6bbb5b5f84
replicaset.apps/app2-745ccb95df   1         1         1       43s   nginx        nginx    app=2,pod-template-hash=745ccb95df
bharathkumardasaraju@k8s_manifests$



bharathkumardasaraju@k8s_manifests$ kubectl exec -it app1-6bbb5b5f84-mjwjf -- curl http://app2
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
bharathkumardasaraju@k8s_manifests$


bharathkumardasaraju@k8s_manifests$ kubectl exec -it app2-745ccb95df-qgknr  -- curl http://app1
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
bharathkumardasaraju@k8s_manifests$




bharathkumardasaraju@k8s_manifests$ kubectl apply -f 1.network-policy.yaml
networkpolicy.networking.k8s.io/default-deny created
bharathkumardasaraju@k8s_manifests$ kubectl exec -it app2-745ccb95df-qgknr  -- curl http://app1




^Ccommand terminated with exit code 130
bharathkumardasaraju@k8s_manifests$ kubectl exec -it app1-6bbb5b5f84-mjwjf -- curl http://app2
^Ccommand terminated with exit code 130
bharathkumardasaraju@k8s_manifests$ kubectl get networkpolicies
NAME           POD-SELECTOR   AGE
default-deny   <none>         25s
bharathkumardasaraju@k8s_manifests$ kubectl get networkpolicies default-deny -o yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"networking.k8s.io/v1","kind":"NetworkPolicy","metadata":{"annotations":{},"name":"default-deny","namespace":"default"},"spec":{"podSelector":{"matchLabels":{}},"policyTypes":["Ingress","Egress"]}}
  creationTimestamp: "2024-10-05T00:27:29Z"
  finalizers:
  - networking.k8s.aws/resources
  generation: 1
  name: default-deny
  namespace: default
  resourceVersion: "24164"
  uid: a8a1eff9-196e-4c2a-9384-54fe94e01921
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  - Egress
bharathkumardasaraju@k8s_manifests$





bharathkumardasaraju@k8s_manifests$ kubectl exec -it app1-6bbb5b5f84-mjwjf -- curl http://app2
^Ccommand terminated with exit code 130
bharathkumardasaraju@k8s_manifests$ kubectl exec -it app2-745ccb95df-qgknr  -- curl http://app1
^Ccommand terminated with exit code 130
bharathkumardasaraju@k8s_manifests$ kubectl get svc
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
app1         ClusterIP   10.100.214.2     <none>        80/TCP    28m
app2         ClusterIP   10.100.235.176   <none>        80/TCP    28m
kubernetes   ClusterIP   10.100.0.1       <none>        443/TCP   136m
bharathkumardasaraju@k8s_manifests$ kubectl exec -it app2-745ccb95df-qgknr  -- curl http://10.100.214.2
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
bharathkumardasaraju@k8s_manifests$ kubectl exec -it app1-6bbb5b5f84-mjwjf -- curl http://10.100.235.176
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
bharathkumardasaraju@k8s_manifests$


bharathkumardasaraju@k8s_manifests$ kubectl get networkpolicies
NAME           POD-SELECTOR   AGE
allow-app1     app=1          3m4s
allow-app2     app=2          3m
default-deny   <none>         13m
bharathkumardasaraju@k8s_manifests$


Below updated policy to talk to coreDNS on port 53 to get the service name resolved

==========================================================================================

    - to:
        - namespaceSelector: {}  # This means to any namespace
          podSelector:
            matchLabels:
              k8s-app: "kube-dns"
      ports:
        - port: 53
          protocol: UDP

==========================================================================================

bharathkumardasaraju@k8s_manifests$ kubectl get pods
NAME                    READY   STATUS    RESTARTS   AGE
app1-6bbb5b5f84-mjwjf   1/1     Running   0          28m
app2-745ccb95df-qgknr   1/1     Running   0          28m
bharathkumardasaraju@k8s_manifests$ kubectl exec -it app1-6bbb5b5f84-mjwjf   -- curl http://app2
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
bharathkumardasaraju@k8s_manifests$