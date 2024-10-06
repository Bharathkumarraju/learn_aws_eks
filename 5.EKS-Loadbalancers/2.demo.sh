subnet tags should be like this

kubernetes.io/role/internal-elb: 1

kubernetes.io/role/elb: 1



NodeAutoScalingGroup
eks-cluster-stack-NodeGroup-lPkzpHxQlTY7
The autoscaling group
-
NodeInstanceRole
arn:aws:iam::730335519137:role/eks-cluster-stack-NodeInstanceRole-0MHqD1Svhjf6
The node instance role
-
NodeSecurityGroup
sg-07c9db9f1f59baef2
The security group for the node group
-


root@aws-client ~ on ☁️  (us-east-1) ➜  aws eks update-kubeconfig --region us-east-1 --name demo-eks
Added new context arn:aws:eks:us-east-1:730335519137:cluster/demo-eks to /root/.kube/config

root@aws-client ~ on ☁️  (us-east-1) ➜  vim aws-auth-cm.yaml

root@aws-client ~ on ☁️  (us-east-1) ➜  kubectl apply -f aws-auth-cm.yaml
configmap/aws-auth created

root@aws-client ~ on ☁️  (us-east-1) ➜  cat aws-auth-cm.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: arn:aws:iam::730335519137:role/eks-cluster-stack-NodeInstanceRole-0MHqD1Svhjf6
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes

root@aws-client ~ on ☁️  (us-east-1) ➜


root@aws-client ~ on ☁️  (us-east-1) ➜  kubectl get nodes -o wide
NAME                            STATUS     ROLES    AGE   VERSION               INTERNAL-IP     EXTERNAL-IP      OS-IMAGE         KERNEL-VERSION                  CONTAINER-RUNTIME
ip-172-31-24-135.ec2.internal   NotReady   <none>   21s   v1.30.4-eks-a737599   172.31.24.135   107.21.139.237   Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
ip-172-31-8-114.ec2.internal    NotReady   <none>   22s   v1.30.4-eks-a737599   172.31.8.114    44.222.141.187   Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
ip-172-31-82-119.ec2.internal   NotReady   <none>   26s   v1.30.4-eks-a737599   172.31.82.119   3.86.160.52      Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11

root@aws-client ~ on ☁️  (us-east-1) ➜





root@aws-client ~ on ☁️  (us-east-1) ➜  vim v2_7_2_full.yaml

root@aws-client ~ on ☁️  (us-east-1) ➜  kubectl apply -f v2_7_2_full.yaml
customresourcedefinition.apiextensions.k8s.io/ingressclassparams.elbv2.k8s.aws created
customresourcedefinition.apiextensions.k8s.io/targetgroupbindings.elbv2.k8s.aws created
serviceaccount/aws-load-balancer-controller created
role.rbac.authorization.k8s.io/aws-load-balancer-controller-leader-election-role created
clusterrole.rbac.authorization.k8s.io/aws-load-balancer-controller-role created
rolebinding.rbac.authorization.k8s.io/aws-load-balancer-controller-leader-election-rolebinding created
clusterrolebinding.rbac.authorization.k8s.io/aws-load-balancer-controller-rolebinding created
service/aws-load-balancer-webhook-service created
deployment.apps/aws-load-balancer-controller created
certificate.cert-manager.io/aws-load-balancer-serving-cert created
issuer.cert-manager.io/aws-load-balancer-selfsigned-issuer created
mutatingwebhookconfiguration.admissionregistration.k8s.io/aws-load-balancer-webhook created
validatingwebhookconfiguration.admissionregistration.k8s.io/aws-load-balancer-webhook created

root@aws-client ~ on ☁️  (us-east-1) ➜




root@aws-client ~ on ☁️  (us-east-1) ➜  kubectl get all -A
NAMESPACE      NAME                                                READY   STATUS    RESTARTS   AGE
cert-manager   pod/cert-manager-7dfbf568d5-j97c2                   1/1     Running   0          5m25s
cert-manager   pod/cert-manager-cainjector-868f7f9bcd-spvfs        1/1     Running   0          5m25s
cert-manager   pod/cert-manager-webhook-6d4c84d7cb-t6mrx           1/1     Running   0          5m25s
kube-system    pod/aws-load-balancer-controller-646cddd956-kr5dp   1/1     Running   0          3m33s
kube-system    pod/aws-node-j8tdd                                  2/2     Running   0          6m45s
kube-system    pod/aws-node-mngf5                                  2/2     Running   0          6m49s
kube-system    pod/aws-node-rzq7k                                  2/2     Running   0          6m44s
kube-system    pod/coredns-586b798467-c8rq5                        1/1     Running   0          23m
kube-system    pod/coredns-586b798467-rwvxh                        1/1     Running   0          23m
kube-system    pod/eks-pod-identity-agent-2jmm6                    1/1     Running   0          6m49s
kube-system    pod/eks-pod-identity-agent-qd6pb                    1/1     Running   0          6m44s
kube-system    pod/eks-pod-identity-agent-v8qtr                    1/1     Running   0          6m45s
kube-system    pod/kube-proxy-92tjt                                1/1     Running   0          6m49s
kube-system    pod/kube-proxy-nz4v8                                1/1     Running   0          6m45s
kube-system    pod/kube-proxy-r2n2h                                1/1     Running   0          6m44s

NAMESPACE      NAME                                        TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                  AGE
cert-manager   service/cert-manager                        ClusterIP   10.100.232.232   <none>        9402/TCP                 5m27s
cert-manager   service/cert-manager-webhook                ClusterIP   10.100.148.116   <none>        443/TCP                  5m26s
default        service/kubernetes                          ClusterIP   10.100.0.1       <none>        443/TCP                  33m
kube-system    service/aws-load-balancer-webhook-service   ClusterIP   10.100.7.223     <none>        443/TCP                  3m34s
kube-system    service/kube-dns                            ClusterIP   10.100.0.10      <none>        53/UDP,53/TCP,9153/TCP   23m

NAMESPACE     NAME                                    DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
kube-system   daemonset.apps/aws-node                 3         3         3       3            3           <none>          23m
kube-system   daemonset.apps/eks-pod-identity-agent   3         3         3       3            3           <none>          23m
kube-system   daemonset.apps/kube-proxy               3         3         3       3            3           <none>          23m

NAMESPACE      NAME                                           READY   UP-TO-DATE   AVAILABLE   AGE
cert-manager   deployment.apps/cert-manager                   1/1     1            1           5m26s
cert-manager   deployment.apps/cert-manager-cainjector        1/1     1            1           5m26s
cert-manager   deployment.apps/cert-manager-webhook           1/1     1            1           5m26s
kube-system    deployment.apps/aws-load-balancer-controller   1/1     1            1           3m34s
kube-system    deployment.apps/coredns                        2/2     2            2           23m

NAMESPACE      NAME                                                      DESIRED   CURRENT   READY   AGE
cert-manager   replicaset.apps/cert-manager-7dfbf568d5                   1         1         1       5m26s
cert-manager   replicaset.apps/cert-manager-cainjector-868f7f9bcd        1         1         1       5m26s
cert-manager   replicaset.apps/cert-manager-webhook-6d4c84d7cb           1         1         1       5m26s
kube-system    replicaset.apps/aws-load-balancer-controller-646cddd956   1         1         1       3m34s
kube-system    replicaset.apps/coredns-586b798467                        2         2         2       23m

root@aws-client ~ on ☁️  (us-east-1) ➜



root@aws-client ~ on ☁️  (us-east-1) ➜  kubectl apply -f webapp-color.yml -f webapp-color-svc.yml
deployment.apps/webapp-color created
service/webapp-color created

root@aws-client ~ on ☁️  (us-east-1) ➜  kubectl get ingress -A
No resources found

root@aws-client ~ on ☁️  (us-east-1) ➜  kubectl get all -n default
NAME                                READY   STATUS    RESTARTS   AGE
pod/webapp-color-565df4fd47-swvq5   1/1     Running   0          27s
pod/webapp-color-565df4fd47-tsj2c   1/1     Running   0          27s
pod/webapp-color-565df4fd47-w9v7j   1/1     Running   0          27s

NAME                   TYPE           CLUSTER-IP       EXTERNAL-IP                                                                    PORT(S)        AGE
service/kubernetes     ClusterIP      10.100.0.1       <none>                                                                         443/TCP        38m
service/webapp-color   LoadBalancer   10.100.237.251   k8s-default-webappco-4f4f4bd20d-404b60e54457d2b1.elb.us-east-1.amazonaws.com   80:30943/TCP   27s

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/webapp-color   3/3     3            3           27s

NAME                                      DESIRED   CURRENT   READY   AGE
replicaset.apps/webapp-color-565df4fd47   3         3         3       27s

root@aws-client ~ on ☁️  (us-east-1) ➜



