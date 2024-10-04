bharathkumardasaraju@learn_aws_eks$ eksdemo create cluster hanuman-cluster --region eu-west-2 -i t3.medium
2024-10-05 06:19:21 [ℹ]  eksctl version 0.191.0
2024-10-05 06:19:21 [ℹ]  using region eu-west-2
2024-10-05 06:19:23 [ℹ]  setting availability zones to [eu-west-2c eu-west-2b eu-west-2a]
2024-10-05 06:19:23 [ℹ]  subnets for eu-west-2c - public:192.168.0.0/19 private:192.168.96.0/19
2024-10-05 06:19:23 [ℹ]  subnets for eu-west-2b - public:192.168.32.0/19 private:192.168.128.0/19
2024-10-05 06:19:23 [ℹ]  subnets for eu-west-2a - public:192.168.64.0/19 private:192.168.160.0/19
2024-10-05 06:19:23 [ℹ]  nodegroup "main" will use "ami-096da6485ead207a0" [AmazonLinux2/1.30]
2024-10-05 06:19:23 [ℹ]  using Kubernetes version 1.30
2024-10-05 06:19:23 [ℹ]  creating EKS cluster "hanuman-cluster" in "eu-west-2" region with managed nodes
2024-10-05 06:19:23 [ℹ]  1 nodegroup (main) was included (based on the include/exclude rules)
2024-10-05 06:19:23 [ℹ]  will create a CloudFormation stack for cluster itself and 0 nodegroup stack(s)
2024-10-05 06:19:23 [ℹ]  will create a CloudFormation stack for cluster itself and 1 managed nodegroup stack(s)
2024-10-05 06:19:23 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=eu-west-2 --cluster=hanuman-cluster'
2024-10-05 06:19:23 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "hanuman-cluster" in "eu-west-2"
2024-10-05 06:19:23 [ℹ]  configuring CloudWatch logging for cluster "hanuman-cluster" in "eu-west-2" (enabled types: api, audit, authenticator, controllerManager, scheduler & no types disabled)
2024-10-05 06:19:23 [ℹ]  default addons kube-proxy, coredns were not specified, will install them as EKS addons
2024-10-05 06:19:23 [ℹ]
2 sequential tasks: { create cluster control plane "hanuman-cluster",
    2 sequential sub-tasks: {
        5 sequential sub-tasks: {
            1 task: { create addons },
            wait for control plane to become ready,
            associate IAM OIDC provider,
            4 parallel sub-tasks: {
                create IAM role for serviceaccount "awslb/aws-load-balancer-controller",
                create IAM role for serviceaccount "kube-system/ebs-csi-controller-sa",
                create IAM role for serviceaccount "external-dns/external-dns",
                create IAM role for serviceaccount "karpenter/karpenter",
            },
            update VPC CNI to use IRSA if required,
        },
        create managed nodegroup "main",
    }
}
2024-10-05 06:19:23 [ℹ]  building cluster stack "eksctl-hanuman-cluster-cluster"
2024-10-05 06:19:25 [ℹ]  deploying stack "eksctl-hanuman-cluster-cluster"
2024-10-05 06:19:55 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-cluster"
2024-10-05 06:20:27 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-cluster"
2024-10-05 06:21:28 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-cluster"
2024-10-05 06:22:30 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-cluster"
2024-10-05 06:23:32 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-cluster"
2024-10-05 06:24:33 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-cluster"
2024-10-05 06:25:34 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-cluster"
2024-10-05 06:26:36 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-cluster"
2024-10-05 06:26:42 [!]  recommended policies were found for "vpc-cni" addon, but since OIDC is disabled on the cluster, eksctl cannot configure the requested permissions; the recommended way to provide IAM permissions for "vpc-cni" addon is via pod identity associations; after addon creation is completed, add all recommended policies to the config file, under `addon.PodIdentityAssociations`, and run `eksctl update addon`
2024-10-05 06:26:42 [ℹ]  creating addon
2024-10-05 06:26:42 [ℹ]  successfully created addon
2024-10-05 06:26:43 [ℹ]  creating addon
2024-10-05 06:26:43 [ℹ]  successfully created addon
2024-10-05 06:26:44 [ℹ]  creating addon
2024-10-05 06:26:45 [ℹ]  successfully created addon



2024-10-05 06:28:50 [ℹ]  building iamserviceaccount stack "eksctl-hanuman-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2024-10-05 06:28:50 [ℹ]  building iamserviceaccount stack "eksctl-hanuman-cluster-addon-iamserviceaccount-karpenter-karpenter"
2024-10-05 06:28:50 [ℹ]  building iamserviceaccount stack "eksctl-hanuman-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2024-10-05 06:28:50 [ℹ]  building iamserviceaccount stack "eksctl-hanuman-cluster-addon-iamserviceaccount-external-dns-external-dns"
2024-10-05 06:28:52 [ℹ]  deploying stack "eksctl-hanuman-cluster-addon-iamserviceaccount-external-dns-external-dns"
2024-10-05 06:28:52 [ℹ]  deploying stack "eksctl-hanuman-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2024-10-05 06:28:52 [ℹ]  deploying stack "eksctl-hanuman-cluster-addon-iamserviceaccount-karpenter-karpenter"
2024-10-05 06:28:52 [ℹ]  deploying stack "eksctl-hanuman-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2024-10-05 06:28:52 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-external-dns-external-dns"
2024-10-05 06:28:52 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2024-10-05 06:28:52 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-karpenter-karpenter"
2024-10-05 06:28:53 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2024-10-05 06:29:23 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-external-dns-external-dns"
2024-10-05 06:29:23 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2024-10-05 06:29:24 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2024-10-05 06:29:24 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-karpenter-karpenter"
2024-10-05 06:30:00 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2024-10-05 06:30:04 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-karpenter-karpenter"
2024-10-05 06:30:19 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-iamserviceaccount-external-dns-external-dns"
2024-10-05 06:30:23 [ℹ]  deploying stack "eksctl-hanuman-cluster-addon-vpc-cni"
2024-10-05 06:30:23 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-vpc-cni"
2024-10-05 06:30:54 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-addon-vpc-cni"
2024-10-05 06:30:55 [ℹ]  updating addon
2024-10-05 06:31:06 [ℹ]  addon "vpc-cni" active
2024-10-05 06:31:08 [ℹ]  building managed nodegroup stack "eksctl-hanuman-cluster-nodegroup-main"
2024-10-05 06:31:10 [ℹ]  deploying stack "eksctl-hanuman-cluster-nodegroup-main"
2024-10-05 06:31:11 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-nodegroup-main"
2024-10-05 06:31:42 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-nodegroup-main"
2024-10-05 06:32:35 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-nodegroup-main"
2024-10-05 06:34:35 [ℹ]  waiting for CloudFormation stack "eksctl-hanuman-cluster-nodegroup-main"
2024-10-05 06:34:35 [ℹ]  waiting for the control plane to become ready
2024-10-05 06:34:36 [✔]  saved kubeconfig as "/Users/bharathkumardasaraju/.kube/config"
2024-10-05 06:34:36 [ℹ]  no tasks
2024-10-05 06:34:36 [✔]  all EKS cluster resources for "hanuman-cluster" have been created
2024-10-05 06:34:36 [✔]  created 0 nodegroup(s) in cluster "hanuman-cluster"
2024-10-05 06:34:36 [✔]  created 1 managed nodegroup(s) in cluster "hanuman-cluster"
2024-10-05 06:34:37 [ℹ]  kubectl command should work with "/Users/bharathkumardasaraju/.kube/config", try 'kubectl get nodes'
2024-10-05 06:34:37 [✔]  EKS cluster "hanuman-cluster" in "eu-west-2" region is ready
bharathkumardasaraju@learn_aws_eks$
bharathkumardasaraju@learn_aws_eks$
bharathkumardasaraju@learn_aws_eks$
bharathkumardasaraju@learn_aws_eks$ eksdemo get vpc
+-----------------------+------------------------------------+----------------+--------------+
|          Id           |                Name                |  IPv4 CIDR(s)  | IPv6 CIDR(s) |
+-----------------------+------------------------------------+----------------+--------------+
| vpc-0772cf6574f4fb4fb | eksctl-hanuman-cluster-cluster/VPC | 192.168.0.0/16 | -            |
| vpc-f461159d          | *                                  | 172.31.0.0/16  | -            |
+-----------------------+------------------------------------+----------------+--------------+
* Indicates default VPC
bharathkumardasaraju@learn_aws_eks$ eksdemo get eni
+------------------------+---------------------+-----------------+-----+-----+--------------------------+
|           Id           |  Instance Id or...  |  Private IPv4   | IPs | SGs |          Subnet          |
+------------------------+---------------------+-----------------+-----+-----+--------------------------+
| *eni-0c803b3d944d74a2d | i-00b6efdab721276a7 | 192.168.189.64  |   6 |   1 | subnet-0ebc089e0270e252b |
| eni-09b0b3c9ff4739e63  | eks_control_plane   | 192.168.164.222 |   1 |   2 | subnet-0ebc089e0270e252b |
| eni-015b56b41146e17a3  | i-00b6efdab721276a7 | 192.168.172.250 |   6 |   1 | subnet-0ebc089e0270e252b |
| eni-044c0dd6638c97020  | nat_gateway         | 192.168.18.186  |   1 |   0 | subnet-082abc81f7eb98e42 |
| eni-0ef3637cd99e571de  | i-0ffa54f6cb76122e1 | 192.168.108.122 |   6 |   1 | subnet-03c164d8252d737c7 |
| *eni-0eaac9f174c56961f | i-0ffa54f6cb76122e1 | 192.168.100.135 |   6 |   1 | subnet-03c164d8252d737c7 |
| eni-046022b8ee42cfb85  | eks_control_plane   | 192.168.158.38  |   1 |   2 | subnet-0b261a9f6db03ca0f |
+------------------------+---------------------+-----------------+-----+-----+--------------------------+
* Indicates Primary network interface
bharathkumardasaraju@learn_aws_eks$ kubectl get nodes -o wide
NAME                                             STATUS   ROLES    AGE   VERSION               INTERNAL-IP       EXTERNAL-IP   OS-IMAGE         KERNEL-VERSION                  CONTAINER-RUNTIME
i-00b6efdab721276a7.eu-west-2.compute.internal   Ready    <none>   20m   v1.30.4-eks-a737599   192.168.189.64    <none>        Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
i-0ffa54f6cb76122e1.eu-west-2.compute.internal   Ready    <none>   20m   v1.30.4-eks-a737599   192.168.100.135   <none>        Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
bharathkumardasaraju@learn_aws_eks$ eksdemo get instances
+------------+---------+---------------------+---------------------------+-----------+------------+
|    Age     |  State  |         Id          |           Name            |   Type    |    Zone    |
+------------+---------+---------------------+---------------------------+-----------+------------+
| 21 minutes | running | i-00b6efdab721276a7 | hanuman-cluster-main-Node | t3.medium | eu-west-2a |
| 21 minutes | running | i-0ffa54f6cb76122e1 | hanuman-cluster-main-Node | t3.medium | eu-west-2c |
+------------+---------+---------------------+---------------------------+-----------+------------+
bharathkumardasaraju@learn_aws_eks$


