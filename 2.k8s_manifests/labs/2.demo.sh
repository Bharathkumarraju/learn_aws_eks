root@aws-client:~# kubectl get pods -o wide
NAME    READY   STATUS    RESTARTS   AGE   IP              NODE                            NOMINATED NODE   READINESS GATES
nginx   1/1     Running   0          63s   172.31.86.223   ip-172-31-91-166.ec2.internal   <none>           <none>
root@aws-client:~# aws ec2 describe-vpcs --query 'Vpcs[*].{VpcId:VpcId,CidrBlock:CidrBlock}' --output table
--------------------------------------------
|               DescribeVpcs               |
+----------------+-------------------------+
|    CidrBlock   |          VpcId          |
+----------------+-------------------------+
|  172.31.0.0/16 |  vpc-00df73f4a54e354fd  |
+----------------+-------------------------+
root@aws-client:~# kubectl get pod nginx -o jsonpath='{.status.podIP}'
172.31.86.223
root@aws-client:~#



curl -o aws-k8s-cni.yaml https://raw.githubusercontent.com/aws/amazon-vpc-cni-k8s/master/config/master/aws-k8s-cni.yaml


