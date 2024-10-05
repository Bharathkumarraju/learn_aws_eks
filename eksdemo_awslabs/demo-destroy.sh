bharathkumardasaraju@test$ eksdemo get cluster
+---------+--------+------------------+---------+----------+----------+
|   Age   | Status |     Cluster      | Version | Platform | Endpoint |
+---------+--------+------------------+---------+----------+----------+
| 3 hours | ACTIVE | *hanuman-cluster |    1.30 | eks.8    | Public   |
+---------+--------+------------------+---------+----------+----------+
* Indicates current context in local kubeconfig
bharathkumardasaraju@test$ eksdemo delete cluster hanuman-cluster
2024-10-05 09:48:53 [ℹ]  deleting EKS cluster "hanuman-cluster"
2024-10-05 09:48:57 [ℹ]  will drain 0 unmanaged nodegroup(s) in cluster "hanuman-cluster"
2024-10-05 09:48:57 [ℹ]  starting parallel draining, max in-flight of 1
2024-10-05 09:48:57 [✖]  failed to acquire semaphore while waiting for all routines to finish: context canceled
2024-10-05 09:48:59 [ℹ]  deleted 0 Fargate profile(s)
2024-10-05 09:49:03 [✔]  kubeconfig has been updated
2024-10-05 09:49:03 [ℹ]  cleaning up AWS load balancers created by Kubernetes objects of Kind Service or Ingress
2024-10-05 09:49:15 [ℹ]
4 sequential tasks: { delete nodegroup "main",
    2 sequential sub-tasks: {
        4 parallel sub-tasks: {
            2 sequential sub-tasks: {
                delete IAM role for serviceaccount "awslb/aws-load-balancer-controller",
                delete serviceaccount "awslb/aws-load-balancer-controller",
            },
            2 sequential sub-tasks: {
                delete IAM role for serviceaccount "karpenter/karpenter",
                delete serviceaccount "karpenter/karpenter",
            },
            2 sequential sub-tasks: {
                delete IAM role for serviceaccount "external-dns/external-dns",
                delete serviceaccount "external-dns/external-dns",
            },
            2 sequential sub-tasks: {
                delete IAM role for serviceaccount "kube-system/ebs-csi-controller-sa",
                delete serviceaccount "kube-system/ebs-csi-controller-sa",
            },
        },
        delete IAM OIDC provider,
    }, delete addon IAM "eksctl-hanuman-cluster-addon-vpc-cni", delete cluster control plane "hanuman-cluster" [async]
}
2024-10-05 09:49:16 [ℹ]  will delete stack "eksctl-hanuman-cluster-nodegroup-main"
2024-10-05 09:49:16 [ℹ]  waiting for stack "eksctl-hanuman-cluster-nodegroup-main" to get deleted
2024-10-05 09:49:16 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-nodegroup-main"
2024-10-05 09:49:47 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-nodegroup-main"
2024-10-05 09:50:26 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-nodegroup-main"









2024-10-05 09:52:08 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-nodegroup-main"









2024-10-05 09:56:10 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-nodegroup-main"
2024-10-05 09:58:00 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-nodegroup-main"
2024-10-05 09:59:13 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-nodegroup-main"
2024-10-05 09:59:14 [ℹ]  will delete stack "eksctl-hanuman-cluster-addon-iamserviceaccount-karpenter-karpenter"
2024-10-05 09:59:14 [ℹ]  waiting for stack "eksctl-hanuman-cluster-addon-iamserviceaccount-karpenter-karpenter" to get deleted
2024-10-05 09:59:14 [ℹ]  will delete stack "eksctl-hanuman-cluster-addon-iamserviceaccount-external-dns-external-dns"
2024-10-05 09:59:14 [ℹ]  waiting for stack "eksctl-hanuman-cluster-addon-iamserviceaccount-external-dns-external-dns" to get deleted
2024-10-05 09:59:14 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-karpenter-karpenter"
2024-10-05 09:59:14 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-external-dns-external-dns"
2024-10-05 09:59:14 [ℹ]  will delete stack "eksctl-hanuman-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2024-10-05 09:59:14 [ℹ]  waiting for stack "eksctl-hanuman-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa" to get deleted
2024-10-05 09:59:14 [ℹ]  will delete stack "eksctl-hanuman-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2024-10-05 09:59:14 [ℹ]  waiting for stack "eksctl-hanuman-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller" to get deleted
2024-10-05 09:59:15 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2024-10-05 09:59:15 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2024-10-05 09:59:44 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-karpenter-karpenter"
2024-10-05 09:59:45 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-external-dns-external-dns"
2024-10-05 09:59:45 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2024-10-05 09:59:45 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2024-10-05 09:59:46 [ℹ]  serviceaccount "awslb/aws-load-balancer-controller" was already deleted
2024-10-05 09:59:46 [ℹ]  serviceaccount "kube-system/ebs-csi-controller-sa" was already deleted
2024-10-05 09:59:46 [ℹ]  serviceaccount "external-dns/external-dns" was already deleted
2024-10-05 09:59:46 [ℹ]  serviceaccount "karpenter/karpenter" was already deleted
2024-10-05 09:59:47 [ℹ]  will delete stack "eksctl-hanuman-cluster-addon-vpc-cni"
2024-10-05 09:59:48 [ℹ]  will delete stack "eksctl-hanuman-cluster-cluster"
2024-10-05 09:59:50 [✔]  all cluster resources were deleted
bharathkumardasaraju@test$

