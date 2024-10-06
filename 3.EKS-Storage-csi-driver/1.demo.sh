EKS Storage

EBS-CSI-Driver helm charts


bharathkumardasaraju@git$ eksdemo create cluster hanumans-eks --region eu-west-2 -i t3.medium
2024-10-06 05:14:13 [ℹ]  eksctl version 0.191.0
2024-10-06 05:14:13 [ℹ]  using region eu-west-2
2024-10-06 05:14:15 [ℹ]  setting availability zones to [eu-west-2a eu-west-2b eu-west-2c]
2024-10-06 05:14:15 [ℹ]  subnets for eu-west-2a - public:192.168.0.0/19 private:192.168.96.0/19
2024-10-06 05:14:15 [ℹ]  subnets for eu-west-2b - public:192.168.32.0/19 private:192.168.128.0/19
2024-10-06 05:14:15 [ℹ]  subnets for eu-west-2c - public:192.168.64.0/19 private:192.168.160.0/19
2024-10-06 05:14:15 [ℹ]  nodegroup "main" will use "ami-096da6485ead207a0" [AmazonLinux2/1.30]
2024-10-06 05:14:16 [ℹ]  using Kubernetes version 1.30
2024-10-06 05:14:16 [ℹ]  creating EKS cluster "hanumans-eks" in "eu-west-2" region with managed nodes
2024-10-06 05:14:16 [ℹ]  1 nodegroup (main) was included (based on the include/exclude rules)
2024-10-06 05:14:16 [ℹ]  will create a CloudFormation stack for cluster itself and 0 nodegroup stack(s)
2024-10-06 05:14:16 [ℹ]  will create a CloudFormation stack for cluster itself and 1 managed nodegroup stack(s)
2024-10-06 05:14:16 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=eu-west-2 --cluster=hanumans-eks'
2024-10-06 05:14:16 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "hanumans-eks" in "eu-west-2"
2024-10-06 05:14:16 [ℹ]  configuring CloudWatch logging for cluster "hanumans-eks" in "eu-west-2" (enabled types: api, audit, authenticator, controllerManager, scheduler & no types disabled)
2024-10-06 05:14:16 [ℹ]  default addons kube-proxy, coredns were not specified, will install them as EKS addons
2024-10-06 05:14:16 [ℹ]
2 sequential tasks: { create cluster control plane "hanumans-eks",
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
2024-10-06 05:14:16 [ℹ]  building cluster stack "eksctl-hanumans-eks-cluster"
2024-10-06 05:14:18 [ℹ]  deploying stack "eksctl-hanumans-eks-cluster"
2024-10-06 05:14:48 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-cluster"
2024-10-06 05:15:19 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-cluster"
2024-10-06 05:16:20 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-cluster"
2024-10-06 05:17:21 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-cluster"
2024-10-06 05:18:22 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-cluster"
2024-10-06 05:19:24 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-cluster"
2024-10-06 05:20:25 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-cluster"
2024-10-06 05:21:26 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-cluster"
2024-10-06 05:22:27 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-cluster"
2024-10-06 05:22:35 [!]  recommended policies were found for "vpc-cni" addon, but since OIDC is disabled on the cluster, eksctl cannot configure the requested permissions; the recommended way to provide IAM permissions for "vpc-cni" addon is via pod identity associations; after addon creation is completed, add all recommended policies to the config file, under `addon.PodIdentityAssociations`, and run `eksctl update addon`
2024-10-06 05:22:35 [ℹ]  creating addon
2024-10-06 05:22:35 [ℹ]  successfully created addon
2024-10-06 05:22:36 [ℹ]  creating addon
2024-10-06 05:22:36 [ℹ]  successfully created addon
2024-10-06 05:22:37 [ℹ]  creating addon
2024-10-06 05:22:38 [ℹ]  successfully created addon
2024-10-06 05:24:44 [ℹ]  building iamserviceaccount stack "eksctl-hanumans-eks-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2024-10-06 05:24:44 [ℹ]  building iamserviceaccount stack "eksctl-hanumans-eks-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2024-10-06 05:24:44 [ℹ]  building iamserviceaccount stack "eksctl-hanumans-eks-addon-iamserviceaccount-karpenter-karpenter"
2024-10-06 05:24:44 [ℹ]  building iamserviceaccount stack "eksctl-hanumans-eks-addon-iamserviceaccount-external-dns-external-dns"
2024-10-06 05:24:45 [ℹ]  deploying stack "eksctl-hanumans-eks-addon-iamserviceaccount-external-dns-external-dns"
2024-10-06 05:24:45 [ℹ]  deploying stack "eksctl-hanumans-eks-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2024-10-06 05:24:46 [ℹ]  deploying stack "eksctl-hanumans-eks-addon-iamserviceaccount-karpenter-karpenter"
2024-10-06 05:24:46 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-iamserviceaccount-external-dns-external-dns"
2024-10-06 05:24:46 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2024-10-06 05:24:46 [ℹ]  deploying stack "eksctl-hanumans-eks-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2024-10-06 05:24:46 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-iamserviceaccount-karpenter-karpenter"
2024-10-06 05:24:46 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2024-10-06 05:25:17 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-iamserviceaccount-external-dns-external-dns"
2024-10-06 05:25:17 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2024-10-06 05:25:17 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2024-10-06 05:25:17 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-iamserviceaccount-karpenter-karpenter"
2024-10-06 05:25:50 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-iamserviceaccount-karpenter-karpenter"
2024-10-06 05:26:09 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-iamserviceaccount-external-dns-external-dns"
2024-10-06 05:26:13 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2024-10-06 05:26:18 [ℹ]  deploying stack "eksctl-hanumans-eks-addon-vpc-cni"
2024-10-06 05:26:18 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-vpc-cni"
2024-10-06 05:26:49 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-addon-vpc-cni"
2024-10-06 05:26:49 [ℹ]  updating addon
2024-10-06 05:27:01 [ℹ]  addon "vpc-cni" active
2024-10-06 05:27:03 [ℹ]  building managed nodegroup stack "eksctl-hanumans-eks-nodegroup-main"
2024-10-06 05:27:06 [ℹ]  deploying stack "eksctl-hanumans-eks-nodegroup-main"
2024-10-06 05:27:06 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-nodegroup-main"
2024-10-06 05:27:37 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-nodegroup-main"
2024-10-06 05:28:37 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-nodegroup-main"
2024-10-06 05:30:38 [ℹ]  waiting for CloudFormation stack "eksctl-hanumans-eks-nodegroup-main"
2024-10-06 05:30:38 [ℹ]  waiting for the control plane to become ready
2024-10-06 05:30:38 [✔]  saved kubeconfig as "/Users/bharathkumardasaraju/.kube/config"
2024-10-06 05:30:38 [ℹ]  no tasks
2024-10-06 05:30:38 [✔]  all EKS cluster resources for "hanumans-eks" have been created
2024-10-06 05:30:38 [✔]  created 0 nodegroup(s) in cluster "hanumans-eks"
2024-10-06 05:30:38 [✔]  created 1 managed nodegroup(s) in cluster "hanumans-eks"
2024-10-06 05:30:39 [ℹ]  kubectl command should work with "/Users/bharathkumardasaraju/.kube/config", try 'kubectl get nodes'
2024-10-06 05:30:39 [✔]  EKS cluster "hanumans-eks" in "eu-west-2" region is ready
bharathkumardasaraju@git$ kubectl get nodes -o wide
NAME                                             STATUS   ROLES    AGE   VERSION               INTERNAL-IP       EXTERNAL-IP   OS-IMAGE         KERNEL-VERSION                  CONTAINER-RUNTIME
i-04491320ad9c9a554.eu-west-2.compute.internal   Ready    <none>   34m   v1.30.4-eks-a737599   192.168.149.196   <none>        Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
i-0d769faab85e8ec62.eu-west-2.compute.internal   Ready    <none>   34m   v1.30.4-eks-a737599   192.168.102.88    <none>        Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
bharathkumardasaraju@git$


