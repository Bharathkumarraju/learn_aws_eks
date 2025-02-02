bharathkumardasaraju@learn_aws_eks$ kubectl run busybox-crash --image=busybox -- /bin/sh -c "exit 1"
pod/busybox-crash created
bharathkumardasaraju@learn_aws_eks$ kubectl get pods -n default
NAME            READY   STATUS             RESTARTS     AGE
busybox-crash   0/1     CrashLoopBackOff   1 (7s ago)   11s
bharathkumardasaraju@learn_aws_eks$ 




bharathkumardasaraju@learn_aws_eks$ kubectl run busybox-crash --image=busybox -- /bin/sh -c "exit 1"
pod/busybox-crash created
bharathkumardasaraju@learn_aws_eks$ kubectl get pods -n default
NAME            READY   STATUS             RESTARTS     AGE
busybox-crash   0/1     CrashLoopBackOff   1 (7s ago)   11s
bharathkumardasaraju@learn_aws_eks$ kubectl get pods -n default
NAME            READY   STATUS   RESTARTS      AGE
busybox-crash   0/1     Error    2 (19s ago)   23s
bharathkumardasaraju@learn_aws_eks$ kubectl get pods -n default
NAME            READY   STATUS   RESTARTS      AGE
busybox-crash   0/1     Error    2 (23s ago)   27s
bharathkumardasaraju@learn_aws_eks$ 
