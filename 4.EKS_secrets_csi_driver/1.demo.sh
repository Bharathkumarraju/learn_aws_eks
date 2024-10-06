bharathkumardasaraju@git$ helm repo add secrets-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts

"secrets-store-csi-driver" has been added to your repositories
bharathkumardasaraju@git$





bharathkumardasaraju@git$ helm install aws-secrets-csi-driver secrets-store-csi-driver/secrets-store-csi-driver \
  --namespace kube-system \
  --set secrets-store.enableSecretRotation=true \
  --set secrets-store.rotationPollInterval=3600s \
  --set grpcSupportedProviders="aws"

NAME: aws-secrets-csi-driver
LAST DEPLOYED: Sun Oct  6 08:31:02 2024
NAMESPACE: kube-system
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
The Secrets Store CSI Driver is getting deployed to your cluster.

To verify that Secrets Store CSI Driver has started, run:

  kubectl --namespace=kube-system get pods -l "app=secrets-store-csi-driver"

Now you can follow these steps https://secrets-store-csi-driver.sigs.k8s.io/getting-started/usage.html
to create a SecretProviderClass resource, and a deployment using the SecretProviderClass.
bharathkumardasaraju@git$


bharathkumardasaraju@git$ kubectl get all -n kube-system
NAME                                                        READY   STATUS    RESTARTS   AGE
pod/aws-node-jf8tv                                          2/2     Running   0          3h3m
pod/aws-node-lmmqx                                          2/2     Running   0          3h4m
pod/aws-secrets-csi-driver-secrets-store-csi-driver-49x4j   3/3     Running   0          87s
pod/aws-secrets-csi-driver-secrets-store-csi-driver-n5rxq   3/3     Running   0          87s
pod/coredns-c7bbdfbb8-nnff2                                 1/1     Running   0          3h9m
pod/coredns-c7bbdfbb8-x89vp                                 1/1     Running   0          3h9m
pod/ebs-csi-controller-f85b445cf-c47tr                      5/5     Running   0          120m
pod/ebs-csi-controller-f85b445cf-h49jh                      5/5     Running   0          120m
pod/ebs-csi-node-qw4vx                                      3/3     Running   0          120m
pod/ebs-csi-node-rx6rb                                      3/3     Running   0          120m
pod/kube-proxy-pdwbp                                        1/1     Running   0          3h4m
pod/kube-proxy-zzsr9                                        1/1     Running   0          3h3m

NAME               TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)                  AGE
service/kube-dns   ClusterIP   10.100.0.10   <none>        53/UDP,53/TCP,9153/TCP   3h9m

NAME                                                             DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
daemonset.apps/aws-node                                          2         2         2       2            2           <none>                   3h10m
daemonset.apps/aws-secrets-csi-driver-secrets-store-csi-driver   2         2         2       2            2           kubernetes.io/os=linux   88s
daemonset.apps/ebs-csi-node                                      2         2         2       2            2           kubernetes.io/os=linux   120m
daemonset.apps/kube-proxy                                        2         2         2       2            2           <none>                   3h10m

NAME                                 READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/coredns              2/2     2            2           3h9m
deployment.apps/ebs-csi-controller   2/2     2            2           120m

NAME                                           DESIRED   CURRENT   READY   AGE
replicaset.apps/coredns-c7bbdfbb8              2         2         2       3h9m
replicaset.apps/ebs-csi-controller-f85b445cf   2         2         2       120m
bharathkumardasaraju@git$





 bharathkumardasaraju@git$ vim secrets-provider.yaml
 bharathkumardasaraju@git$ kubectl apply -f secrets-provider.yaml
 secretproviderclass.secrets-store.csi.x-k8s.io/aws-secrets created
 bharathkumardasaraju@git$ vim nginx-deploy.yaml
 bharathkumardasaraju@git$ kubectl get secretproviderclass.secrets-store.csi.x-k8s.io/aws-secrets
 NAME          AGE
 aws-secrets   42s
 bharathkumardasaraju@git$ kubectl get secretproviderclass.secrets-store.csi.x-k8s.io/aws-secrets -o yaml
 apiVersion: secrets-store.csi.x-k8s.io/v1
 kind: SecretProviderClass
 metadata:
   annotations:
     kubectl.kubernetes.io/last-applied-configuration: |
       {"apiVersion":"secrets-store.csi.x-k8s.io/v1","kind":"SecretProviderClass","metadata":{"annotations":{},"name":"aws-secrets","namespace":"default"},"spec":{"parameters":{"objects":"- objectName: \"prod/dbpass\"\n  objectType: \"secretsmanager\"\n  jmesPath:\n    - path: \"password\"\n      objectAlias: \"db-password\"\n"},"provider":"aws"}}
   creationTimestamp: "2024-10-06T00:44:17Z"
   generation: 1
   name: aws-secrets
   namespace: default
   resourceVersion: "44769"
   uid: b1051b5e-87a4-43a2-8788-22e9e4461942
 spec:
   parameters:
     objects: |
       - objectName: "prod/dbpass"
         objectType: "secretsmanager"
         jmesPath:
           - path: "password"
             objectAlias: "db-password"
   provider: aws
 bharathkumardasaraju@git$ vim nginx-deploy.yaml


 bharathkumardasaraju@git$ kubectl apply -f nginx-deploy.yaml
 deployment.apps/nginx created
 bharathkumardasaraju@git$



bharathkumardasaraju@git$ kubectl apply -f https://raw.githubusercontent.com/aws/secrets-store-csi-driver-provider-aws/main/deployment/aws-provider-installer.yaml

serviceaccount/csi-secrets-store-provider-aws created
clusterrole.rbac.authorization.k8s.io/csi-secrets-store-provider-aws-cluster-role created
clusterrolebinding.rbac.authorization.k8s.io/csi-secrets-store-provider-aws-cluster-rolebinding created
daemonset.apps/csi-secrets-store-provider-aws created
bharathkumardasaraju@git$ kubectl logs -n kube-system daemonset/aws-secrets-csi-driver-secrets-store-csi-driver

Found 2 pods, using pod/aws-secrets-csi-driver-secrets-store-csi-driver-49x4j
I1006 00:31:20.074451       1 exporter.go:35] "initializing metrics backend" backend="prometheus"
I1006 00:31:20.169047       1 main.go:195] "starting manager\n"
I1006 00:31:20.269153       1 secrets-store.go:46] "Initializing Secrets Store CSI Driver" driver="secrets-store.csi.k8s.io" version="v1.4.5" buildTime="2024-08-20-17:14"
I1006 00:31:20.273114       1 server.go:126] "Listening for connections" address="//csi/csi.sock"
I1006 00:31:21.131436       1 nodeserver.go:359] "node: getting default node info\n"
bharathkumardasaraju@git$





 bharathkumardasaraju@git$ kubectl get pods -o wide
 NAME                     READY   STATUS              RESTARTS   AGE   IP       NODE                                             NOMINATED NODE   READINESS GATES
 nginx-68c94549d6-f8rd8   0/1     ContainerCreating   0          59s   <none>   i-04491320ad9c9a554.eu-west-2.compute.internal   <none>           <none>
 bharathkumardasaraju@git$ eksctl create iamserviceaccount \
   --name testsa \
   --namespace default \
   --cluster hanumans-eks \
   --attach-policy-arn arn:aws:iam::172586632398:policy/access-secrets \
   --approve \
   --override-existing-serviceaccounts

 2024-10-06 08:53:46 [ℹ]  4 existing iamserviceaccount(s) (awslb/aws-load-balancer-controller,external-dns/external-dns,karpenter/karpenter,kube-system/ebs-csi-controller-sa) will be excluded
 2024-10-06 08:53:46 [ℹ]  1 iamserviceaccount (default/testsa) was included (based on the include/exclude rules)
 2024-10-06 08:53:46 [!]  metadata of serviceaccounts that exist in Kubernetes will be updated, as --override-existing-serviceaccounts was set
 2024-10-06 08:53:46 [ℹ]  1 task: {
     2 sequential sub-tasks: {
         create IAM role for serviceaccount "default/testsa",
         create serviceaccount "default/testsa",
     } }2024-10-06 08:53:46 [ℹ]  building iamserviceaccount stack "eksctl-hanumans-eks-addon-iamserviceaccount-default-testsa"
 2024-10-06 08:53:47 [ℹ]  deploying stack "eksctl-hanumans-eks-addon-iamserviceaccount-default-testsa"
 2024-10-06 08:53:47 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-iamserviceaccount-default-testsa"
 2024-10-06 08:54:19 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-iamserviceaccount-default-testsa"
 2024-10-06 08:54:20 [ℹ]  created serviceaccount "default/testsa"
 bharathkumardasaraju@git$




bharathkumardasaraju@git$ kubectl get pods -o wide
NAME                     READY   STATUS    RESTARTS   AGE   IP                NODE                                             NOMINATED NODE   READINESS GATES
nginx-6b7877b978-j8nff   1/1     Running   0          28s   192.168.129.236   i-04491320ad9c9a554.eu-west-2.compute.internal   <none>           <none>
bharathkumardasaraju@git$ kubectl exec -it nginx-6b7877b978-j8nff -- sh
#
#
# cd /mnt
# ls -rtlh
total 0
drwxrwxrwt 2 root root 80 Oct  6 00:56 secrets-store
# cd secrets-store
# ls -rtlh
total 8.0K
-rw-r--r-- 1 root root 20 Oct  6 00:56 prod_dbpass
-rw-r--r-- 1 root root  5 Oct  6 00:56 db-password
# cat prod_dbpass
{"password":"12345"}# cat db-password
12345#
#
#

