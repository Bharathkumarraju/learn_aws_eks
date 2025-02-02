bharathkumardasaraju@10.EKS-prom-stack$ eksdemo create cluster bharath-cluster --region eu-west-3 -i t3.medium
2025-02-02 07:30:48 [ℹ]  eksctl version 0.191.0
2025-02-02 07:30:48 [ℹ]  using region eu-west-3
2025-02-02 07:30:49 [ℹ]  setting availability zones to [eu-west-3a eu-west-3c eu-west-3b]
2025-02-02 07:30:49 [ℹ]  subnets for eu-west-3a - public:192.168.0.0/19 private:192.168.96.0/19
2025-02-02 07:30:49 [ℹ]  subnets for eu-west-3c - public:192.168.32.0/19 private:192.168.128.0/19
2025-02-02 07:30:49 [ℹ]  subnets for eu-west-3b - public:192.168.64.0/19 private:192.168.160.0/19
2025-02-02 07:30:49 [ℹ]  nodegroup "main" will use "ami-092f44fd0ea1c5efd" [AmazonLinux2/1.30]
2025-02-02 07:30:49 [ℹ]  using Kubernetes version 1.30
2025-02-02 07:30:49 [ℹ]  creating EKS cluster "bharath-cluster" in "eu-west-3" region with managed nodes
2025-02-02 07:30:49 [ℹ]  1 nodegroup (main) was included (based on the include/exclude rules)
2025-02-02 07:30:49 [ℹ]  will create a CloudFormation stack for cluster itself and 0 nodegroup stack(s)
2025-02-02 07:30:49 [ℹ]  will create a CloudFormation stack for cluster itself and 1 managed nodegroup stack(s)
2025-02-02 07:30:49 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=eu-west-3 --cluster=bharath-cluster'
2025-02-02 07:30:49 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "bharath-cluster" in "eu-west-3"
2025-02-02 07:30:49 [ℹ]  configuring CloudWatch logging for cluster "bharath-cluster" in "eu-west-3" (enabled types: api, audit, authenticator, controllerManager, scheduler & no types disabled)
2025-02-02 07:30:49 [ℹ]  default addons coredns, kube-proxy were not specified, will install them as EKS addons
2025-02-02 07:30:49 [ℹ]
2 sequential tasks: { create cluster control plane "bharath-cluster",
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
2025-02-02 07:30:49 [ℹ]  building cluster stack "eksctl-bharath-cluster-cluster"
2025-02-02 07:30:51 [ℹ]  deploying stack "eksctl-bharath-cluster-cluster"
2025-02-02 07:31:21 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-cluster"
2025-02-02 07:31:52 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-cluster"
2025-02-02 07:32:53 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-cluster"
2025-02-02 07:33:54 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-cluster"
2025-02-02 07:34:55 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-cluster"
2025-02-02 07:35:56 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-cluster"
2025-02-02 07:36:57 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-cluster"
2025-02-02 07:37:58 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-cluster"


2025-02-02 07:38:59 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-cluster"
2025-02-02 07:39:04 [!]  recommended policies were found for "vpc-cni" addon, but since OIDC is disabled on the cluster, eksctl cannot configure the requested permissions; the recommended way to provide IAM permissions for "vpc-cni" addon is via pod identity associations; after addon creation is completed, add all recommended policies to the config file, under `addon.PodIdentityAssociations`, and run `eksctl update addon`
2025-02-02 07:39:04 [ℹ]  creating addon
2025-02-02 07:39:05 [ℹ]  successfully created addon
2025-02-02 07:39:05 [ℹ]  creating addon
2025-02-02 07:39:06 [ℹ]  successfully created addon
2025-02-02 07:39:07 [ℹ]  creating addon
2025-02-02 07:39:07 [ℹ]  successfully created addon


2025-02-02 07:42:02 [ℹ]  building iamserviceaccount stack "eksctl-bharath-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2025-02-02 07:42:02 [ℹ]  building iamserviceaccount stack "eksctl-bharath-cluster-addon-iamserviceaccount-karpenter-karpenter"
2025-02-02 07:42:02 [ℹ]  building iamserviceaccount stack "eksctl-bharath-cluster-addon-iamserviceaccount-external-dns-external-dns"
2025-02-02 07:42:02 [ℹ]  building iamserviceaccount stack "eksctl-bharath-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2025-02-02 07:42:04 [ℹ]  deploying stack "eksctl-bharath-cluster-addon-iamserviceaccount-external-dns-external-dns"
2025-02-02 07:42:04 [ℹ]  deploying stack "eksctl-bharath-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2025-02-02 07:42:04 [ℹ]  deploying stack "eksctl-bharath-cluster-addon-iamserviceaccount-karpenter-karpenter"
2025-02-02 07:42:04 [ℹ]  deploying stack "eksctl-bharath-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2025-02-02 07:42:04 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-addon-iamserviceaccount-external-dns-external-dns"
2025-02-02 07:42:04 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2025-02-02 07:42:04 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-addon-iamserviceaccount-karpenter-karpenter"
2025-02-02 07:42:04 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2025-02-02 07:42:35 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-addon-iamserviceaccount-external-dns-external-dns"
2025-02-02 07:42:35 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2025-02-02 07:42:35 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-addon-iamserviceaccount-karpenter-karpenter"
2025-02-02 07:42:35 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2025-02-02 07:43:08 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-addon-iamserviceaccount-external-dns-external-dns"
2025-02-02 07:43:17 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-addon-iamserviceaccount-karpenter-karpenter"
2025-02-02 07:43:29 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2025-02-02 07:43:32 [ℹ]  deploying stack "eksctl-bharath-cluster-addon-vpc-cni"
2025-02-02 07:43:32 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-addon-vpc-cni"
2025-02-02 07:44:03 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-addon-vpc-cni"
2025-02-02 07:44:03 [ℹ]  updating addon
2025-02-02 07:44:14 [ℹ]  addon "vpc-cni" active
2025-02-02 07:44:17 [ℹ]  building managed nodegroup stack "eksctl-bharath-cluster-nodegroup-main"
2025-02-02 07:44:18 [ℹ]  deploying stack "eksctl-bharath-cluster-nodegroup-main"
2025-02-02 07:44:19 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-nodegroup-main"
2025-02-02 07:44:50 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-nodegroup-main"
2025-02-02 07:45:44 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-nodegroup-main"
2025-02-02 07:47:12 [ℹ]  waiting for CloudFormation stack "eksctl-bharath-cluster-nodegroup-main"
2025-02-02 07:47:12 [ℹ]  waiting for the control plane to become ready
2025-02-02 07:47:13 [✔]  saved kubeconfig as "/Users/bharathkumardasaraju/.kube/config"
2025-02-02 07:47:13 [ℹ]  no tasks
2025-02-02 07:47:13 [✔]  all EKS cluster resources for "bharath-cluster" have been created
2025-02-02 07:47:13 [✔]  created 0 nodegroup(s) in cluster "bharath-cluster"
2025-02-02 07:47:13 [✔]  created 1 managed nodegroup(s) in cluster "bharath-cluster"
2025-02-02 07:47:14 [ℹ]  kubectl command should work with "/Users/bharathkumardasaraju/.kube/config", try 'kubectl get nodes'
2025-02-02 07:47:14 [✔]  EKS cluster "bharath-cluster" in "eu-west-3" region is ready
bharathkumardasaraju@10.EKS-prom-stack$



bharathkumardasaraju@10.EKS-prom-stack$ kubectl get nodes -o wide
NAME                                             STATUS   ROLES    AGE   VERSION               INTERNAL-IP       EXTERNAL-IP   OS-IMAGE         KERNEL-VERSION                  CONTAINER-RUNTIME
i-0cd2305a31c9ca77f.eu-west-3.compute.internal   Ready    <none>   19m   v1.30.8-eks-aeac579   192.168.117.18    <none>        Amazon Linux 2   5.10.230-223.885.amzn2.x86_64   containerd://1.7.23
i-0df208b264c59a88b.eu-west-3.compute.internal   Ready    <none>   19m   v1.30.8-eks-aeac579   192.168.166.211   <none>        Amazon Linux 2   5.10.230-223.885.amzn2.x86_64   containerd://1.7.23
bharathkumardasaraju@10.EKS-prom-stack$ kubectl get namespaces
NAME              STATUS   AGE
default           Active   29m
kube-node-lease   Active   29m
kube-public       Active   29m
kube-system       Active   29m
bharathkumardasaraju@10.EKS-prom-stack$ kubectl cluster-info
Kubernetes control plane is running at https://D629F2CFAEB3F891C34B78544BD985CC.gr7.eu-west-3.eks.amazonaws.com
CoreDNS is running at https://D629F2CFAEB3F891C34B78544BD985CC.gr7.eu-west-3.eks.amazonaws.com/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
bharathkumardasaraju@10.EKS-prom-stack$

