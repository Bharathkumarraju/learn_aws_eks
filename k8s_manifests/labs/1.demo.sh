root@aws-client:~# ls
amazon-elastic-kubernetes-service-course  ec2-user.pem
root@aws-client:~#    aws eks update-kubeconfig --region us-east-1 --name demo-eks
Added new context arn:aws:eks:us-east-1:654654309110:cluster/demo-eks to /root/.kube/config
root@aws-client:~# kubectl get nodes -o wide
No resources found
root@aws-client:~#    curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/cloudformation/2020-10-29/aws-auth-cm.yaml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   282  100   282    0     0    762      0 --:--:-- --:--:-- --:--:--   762
root@aws-client:~# pwd
/root
root@aws-client:~# ls
amazon-elastic-kubernetes-service-course  aws-auth-cm.yaml  ec2-user.pem
root@aws-client:~# cd amazon-elastic-kubernetes-service-course/
root@aws-client:~/amazon-elastic-kubernetes-service-course# cd eks/
root@aws-client:~/amazon-elastic-kubernetes-service-course/eks# ls r-tlh
ls: cannot access 'r-tlh': No such file or directory
root@aws-client:~/amazon-elastic-kubernetes-service-course/eks# ls -rtlh
total 144K
-rw-r--r-- 1 root root 1.2K Oct  5 00:51 variables.tf
-rw-r--r-- 1 root root 4.0K Oct  5 00:51 README.md
-rw-r--r-- 1 root root  629 Oct  5 00:51 main.tf
-rw-r--r-- 1 root root  669 Oct  5 00:59 data.tf
-rw-r--r-- 1 root root 1.5K Oct  5 01:00 eks.tf
-rw-r--r-- 1 root root 8.4K Oct  5 01:14 nodes.tf
-rw-r--r-- 1 root root  49K Oct  5 01:15 terraform.tfstate.backup
-rw-r--r-- 1 root root  59K Oct  5 01:15 terraform.tfstate
root@aws-client:~/amazon-elastic-kubernetes-service-course/eks# terraform ouputs
Terraform has no command named "ouputs". Did you mean "output"?

To see all of Terraform's top-level commands, run:
  terraform -help

root@aws-client:~/amazon-elastic-kubernetes-service-course/eks# terraform ouput
Terraform has no command named "ouput". Did you mean "output"?

To see all of Terraform's top-level commands, run:
  terraform -help

root@aws-client:~/amazon-elastic-kubernetes-service-course/eks# terraform output
NodeAutoScalingGroup = "eks-cluster-stack-NodeGroup-K2GJDzQTlxuO"
NodeInstanceRole = "arn:aws:iam::654654309110:role/eks-demo-node"
NodeSecurityGroup = "sg-03daffd744b04fa9e"
root@aws-client:~/amazon-elastic-kubernetes-service-course/eks# cd ../..
root@aws-client:~# vim aws-auth-cm.yaml
root@aws-client:~#    kubectl apply -f aws-auth-cm.yaml
configmap/aws-auth created
root@aws-client:~#    kubectl get nodes -o wide
NAME                            STATUS     ROLES    AGE   VERSION               INTERNAL-IP     EXTERNAL-IP     OS-IMAGE         KERNEL-VERSION                  CONTAINER-RUNTIME
ip-172-31-0-77.ec2.internal     NotReady   <none>   1s    v1.29.8-eks-a737599   172.31.0.77     44.223.87.136   Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
ip-172-31-91-166.ec2.internal   NotReady   <none>   3s    v1.29.8-eks-a737599   172.31.91.166   3.93.215.75     Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
root@aws-client:~#





root@aws-client:~#    kubectl get nodes -o wide
NAME                            STATUS     ROLES    AGE   VERSION               INTERNAL-IP     EXTERNAL-IP     OS-IMAGE         KERNEL-VERSION                  CONTAINER-RUNTIME
ip-172-31-0-77.ec2.internal     NotReady   <none>   1s    v1.29.8-eks-a737599   172.31.0.77     44.223.87.136   Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
ip-172-31-91-166.ec2.internal   NotReady   <none>   3s    v1.29.8-eks-a737599   172.31.91.166   3.93.215.75     Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
root@aws-client:~# cat aws-auth-cm.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: arn:aws:iam::654654309110:role/eks-demo-node
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
root@aws-client:~#    kubectl get nodes -o wide
NAME                            STATUS   ROLES    AGE    VERSION               INTERNAL-IP     EXTERNAL-IP      OS-IMAGE         KERNEL-VERSION                  CONTAINER-RUNTIME
ip-172-31-0-77.ec2.internal     Ready    <none>   2m2s   v1.29.8-eks-a737599   172.31.0.77     44.223.87.136    Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
ip-172-31-15-132.ec2.internal   Ready    <none>   119s   v1.29.8-eks-a737599   172.31.15.132   18.234.199.169   Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
ip-172-31-91-166.ec2.internal   Ready    <none>   2m4s   v1.29.8-eks-a737599   172.31.91.166   3.93.215.75      Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
root@aws-client:~#

