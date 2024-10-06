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

