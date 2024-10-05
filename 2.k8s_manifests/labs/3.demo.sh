pod/nginx created
root@aws-client:~# kubectl get nodes
NAME                            STATUS   ROLES    AGE   VERSION
ip-172-31-0-77.ec2.internal     Ready    <none>   13m   v1.29.8-eks-a737599
ip-172-31-15-132.ec2.internal   Ready    <none>   13m   v1.29.8-eks-a737599
ip-172-31-91-166.ec2.internal   Ready    <none>   13m   v1.29.8-eks-a737599
root@aws-client:~# aws ec2 describe-network-interfaces --query 'NetworkInterfaces[*].{ID:NetworkInterfaceId,PrivateIpAddress:PrivateIpAddress}'
[
    {
        "ID": "eni-0b7388aa70de38ef4",
        "PrivateIpAddress": "172.31.91.166"
    },
    {
        "ID": "eni-0b1287b020c5a1f87",
        "PrivateIpAddress": "172.31.83.251"
    },
    {
        "ID": "eni-0c21b7f1b76493f9f",
        "PrivateIpAddress": "172.31.4.223"
    },
    {
        "ID": "eni-00bbc42ff91de2e92",
        "PrivateIpAddress": "172.31.15.132"
    },
    {
        "ID": "eni-07c53e1509262640c",
        "PrivateIpAddress": "172.31.2.214"
    },
    {
        "ID": "eni-019ea2b7dc2dc2c9e",
        "PrivateIpAddress": "172.31.0.77"
    }
]
root@aws-client:~# aws ec2 describe-route-tables --query 'RouteTables[*].Routes'
[
    [
        {
            "DestinationCidrBlock": "172.31.0.0/16",
            "GatewayId": "local",
            "Origin": "CreateRouteTable",
            "State": "active"
        },
        {
            "DestinationCidrBlock": "0.0.0.0/0",
            "GatewayId": "igw-0fca49b8e2a2d2898",
            "Origin": "CreateRoute",
            "State": "active"
        }
    ]
]





root@aws-client:~# kubectl get pods -o wide
NAME       READY   STATUS    RESTARTS   AGE     IP              NODE                            NOMINATED NODE   READINESS GATES
nginx      1/1     Running   0          3m53s   172.31.6.80     ip-172-31-15-132.ec2.internal   <none>           <none>
test-pod   1/1     Running   0          2m11s   172.31.94.192   ip-172-31-91-166.ec2.internal   <none>           <none>
root@aws-client:~# kubectl exec -it test-pod -- ping 172.31.6.80
PING 172.31.6.80 (172.31.6.80): 56 data bytes
64 bytes from 172.31.6.80: seq=0 ttl=125 time=0.653 ms
64 bytes from 172.31.6.80: seq=1 ttl=125 time=0.781 ms
64 bytes from 172.31.6.80: seq=2 ttl=125 time=1.568 ms
64 bytes from 172.31.6.80: seq=3 ttl=125 time=0.545 ms
64 bytes from 172.31.6.80: seq=4 ttl=125 time=0.513 ms
64 bytes from 172.31.6.80: seq=5 ttl=125 time=0.577 ms
64 bytes from 172.31.6.80: seq=6 ttl=125 time=0.528 ms
64 bytes from 172.31.6.80: seq=7 ttl=125 time=0.554 ms


