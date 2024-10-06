root@aws-client ~ on ☁️  (us-east-1) ➜  kubectl apply -f 2048_full.yaml
namespace/game-2048 created
deployment.apps/deployment-2048 created
service/service-2048 created
ingress.networking.k8s.io/ingress-2048 created

root@aws-client ~ on ☁️  (us-east-1) ➜


root@aws-client ~ on ☁️  (us-east-1) ✖ kubectl get all -n game-2048
NAME                                  READY   STATUS    RESTARTS   AGE
pod/deployment-2048-85f8c7d69-62mdt   1/1     Running   0          28s
pod/deployment-2048-85f8c7d69-7sghs   1/1     Running   0          28s
pod/deployment-2048-85f8c7d69-b8wqd   1/1     Running   0          28s
pod/deployment-2048-85f8c7d69-qrbwg   1/1     Running   0          28s
pod/deployment-2048-85f8c7d69-w9hgl   1/1     Running   0          28s

NAME                   TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/service-2048   NodePort   10.100.92.72   <none>        80:30150/TCP   28s

NAME                              READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/deployment-2048   5/5     5            5           28s

NAME                                        DESIRED   CURRENT   READY   AGE
replicaset.apps/deployment-2048-85f8c7d69   5         5         5       28s

root@aws-client ~ on ☁️  (us-east-1) ➜


root@aws-client ~ on ☁️  (us-east-1) ➜  kubectl get ingress -A -o wide
NAMESPACE   NAME           CLASS   HOSTS   ADDRESS                                                                  PORTS   AGE
game-2048   ingress-2048   alb     *       k8s-game2048-ingress2-46dbc758ae-663219072.us-east-1.elb.amazonaws.com   80      67s

root@aws-client ~ on ☁️  (us-east-1) ➜


