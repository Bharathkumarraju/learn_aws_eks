

bharathkumardasaraju@learn_aws_eks$ kubectl get nodes -o wide
NAME                                             STATUS   ROLES    AGE   VERSION               INTERNAL-IP       EXTERNAL-IP   OS-IMAGE         KERNEL-VERSION                  CONTAINER-RUNTIME
i-00b6efdab721276a7.eu-west-2.compute.internal   Ready    <none>   36m   v1.30.4-eks-a737599   192.168.189.64    <none>        Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
i-0ffa54f6cb76122e1.eu-west-2.compute.internal   Ready    <none>   36m   v1.30.4-eks-a737599   192.168.100.135   <none>        Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
bharathkumardasaraju@learn_aws_eks$



bharathkumardasaraju@learn_aws_eks$ aws ssm start-session --target i-00b6efdab721276a7

Starting session with SessionId: bharath-es9uxz6fylp3hd8qj74thgyndu
sh-4.2$ sudo su
[root@i-00b6efdab721276a7 bin]# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP group default qlen 1000
    link/ether 06:70:93:11:03:d1 brd ff:ff:ff:ff:ff:ff
    inet 192.168.189.64/19 brd 192.168.191.255 scope global dynamic eth0
       valid_lft 2983sec preferred_lft 2983sec
    inet6 fe80::470:93ff:fe11:3d1/64 scope link
       valid_lft forever preferred_lft forever
3: eni34a96e0c8ac@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc noqueue state UP group default
    link/ether 42:21:9f:a1:78:4d brd ff:ff:ff:ff:ff:ff link-netns cni-3b5825bb-638b-83d2-618d-069516989b01
    inet6 fe80::4021:9fff:fea1:784d/64 scope link
       valid_lft forever preferred_lft forever
4: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP group default qlen 1000
    link/ether 06:30:ea:a3:1c:83 brd ff:ff:ff:ff:ff:ff
    inet 192.168.172.250/19 brd 192.168.191.255 scope global eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::430:eaff:fea3:1c83/64 scope link
       valid_lft forever preferred_lft forever
[root@i-00b6efdab721276a7 bin]#




bharathkumardasaraju@learn_aws_eks$ eksdemo get enis
+------------------------+---------------------+-----------------+-----+-----+--------------------------+
|           Id           |  Instance Id or...  |  Private IPv4   | IPs | SGs |          Subnet          |
+------------------------+---------------------+-----------------+-----+-----+--------------------------+
| eni-09b0b3c9ff4739e63  | eks_control_plane   | 192.168.164.222 |   1 |   2 | subnet-0ebc089e0270e252b |
| eni-015b56b41146e17a3  | i-00b6efdab721276a7 | 192.168.172.250 |   6 |   1 | subnet-0ebc089e0270e252b |
| *eni-0c803b3d944d74a2d | i-00b6efdab721276a7 | 192.168.189.64  |   6 |   1 | subnet-0ebc089e0270e252b |
| eni-046022b8ee42cfb85  | eks_control_plane   | 192.168.158.38  |   1 |   2 | subnet-0b261a9f6db03ca0f |
| eni-044c0dd6638c97020  | nat_gateway         | 192.168.18.186  |   1 |   0 | subnet-082abc81f7eb98e42 |
| eni-0ef3637cd99e571de  | i-0ffa54f6cb76122e1 | 192.168.108.122 |   6 |   1 | subnet-03c164d8252d737c7 |
| *eni-0eaac9f174c56961f | i-0ffa54f6cb76122e1 | 192.168.100.135 |   6 |   1 | subnet-03c164d8252d737c7 |
+------------------------+---------------------+-----------------+-----+-----+--------------------------+
* Indicates Primary network interface
bharathkumardasaraju@learn_aws_eks$ eksdemo get instances
+------------+---------+---------------------+---------------------------+-----------+------------+
|    Age     |  State  |         Id          |           Name            |   Type    |    Zone    |
+------------+---------+---------------------+---------------------------+-----------+------------+
| 54 minutes | running | i-00b6efdab721276a7 | hanuman-cluster-main-Node | t3.medium | eu-west-2a |
| 54 minutes | running | i-0ffa54f6cb76122e1 | hanuman-cluster-main-Node | t3.medium | eu-west-2c |
+------------+---------+---------------------+---------------------------+-----------+------------+
bharathkumardasaraju@learn_aws_eks$ aws ssm start-session --target i-00b6efdab721276a7

Starting session with SessionId: bharath-rkn7plon4jkbcxuurbln8yvq9a
sh-4.2$ sudo su
[root@i-00b6efdab721276a7 bin]# ip route show
default via 192.168.160.1 dev eth0
169.254.169.254 dev eth0
192.168.160.0/19 dev eth0 proto kernel scope link src 192.168.189.64
192.168.178.95 dev eniefb4110901d scope link
192.168.187.250 dev eni34a96e0c8ac scope link
[root@i-00b6efdab721276a7 bin]# exit
exit
sh-4.2$ exit
exit


Exiting session with sessionId: bharath-rkn7plon4jkbcxuurbln8yvq9a.

bharathkumardasaraju@learn_aws_eks$ kubectl get pods -o wide
NAME     READY   STATUS    RESTARTS   AGE     IP                NODE                                             NOMINATED NODE   READINESS GATES
nginx    1/1     Running   0          5m57s   192.168.122.238   i-0ffa54f6cb76122e1.eu-west-2.compute.internal   <none>           <none>
nginx1   1/1     Running   0          5m31s   192.168.178.95    i-00b6efdab721276a7.eu-west-2.compute.internal   <none>           <none>
bharathkumardasaraju@learn_aws_eks$ kubectl exec -it nginx1 -n default -- sh
# ipconfig
sh: 1: ipconfig: not found
# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
3: eth0@if5: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc noqueue state UP group default
    link/ether fe:29:e1:5c:48:8d brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 192.168.178.95/32 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::fc29:e1ff:fe5c:488d/64 scope link
       valid_lft forever preferred_lft forever
#



