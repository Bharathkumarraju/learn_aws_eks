control-plane:
  1. etcd
  2. controller manager
  3. kube-scheduler
  4. api-server


1. eksctl create cluster


eksdemo





bharathkumardasaraju@11.EKS-revisited$ eksdemo create cluster bk-cluster --region ap-south-1 -i t3.medium
2025-04-30 10:54:03 [ℹ]  eksctl version 0.207.0
2025-04-30 10:54:03 [ℹ]  using region ap-south-1
2025-04-30 10:54:03 [ℹ]  setting availability zones to [ap-south-1a ap-south-1b ap-south-1c]
2025-04-30 10:54:03 [ℹ]  subnets for ap-south-1a - public:192.168.0.0/19 private:192.168.96.0/19
2025-04-30 10:54:03 [ℹ]  subnets for ap-south-1b - public:192.168.32.0/19 private:192.168.128.0/19
2025-04-30 10:54:03 [ℹ]  subnets for ap-south-1c - public:192.168.64.0/19 private:192.168.160.0/19
2025-04-30 10:54:03 [ℹ]  nodegroup "main" will use "ami-07de756cb861c25c8" [AmazonLinux2/1.32]
2025-04-30 10:54:03 [ℹ]  using Kubernetes version 1.32
2025-04-30 10:54:03 [ℹ]  creating EKS cluster "bk-cluster" in "ap-south-1" region with managed nodes
2025-04-30 10:54:03 [ℹ]  1 nodegroup (main) was included (based on the include/exclude rules)
2025-04-30 10:54:03 [ℹ]  will create a CloudFormation stack for cluster itself and 1 managed nodegroup stack(s)
2025-04-30 10:54:03 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=ap-south-1 --cluster=bk-cluster'
2025-04-30 10:54:03 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "bk-cluster" in "ap-south-1"
2025-04-30 10:54:03 [ℹ]  configuring CloudWatch logging for cluster "bk-cluster" in "ap-south-1" (enabled types: api, audit, authenticator, controllerManager, scheduler & no types disabled)
2025-04-30 10:54:03 [ℹ]  default addons kube-proxy, coredns, metrics-server were not specified, will install them as EKS addons
2025-04-30 10:54:03 [ℹ]
2 sequential tasks: { create cluster control plane "bk-cluster",
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
2025-04-30 10:54:03 [ℹ]  building cluster stack "eksctl-bk-cluster-cluster"
2025-04-30 10:54:04 [ℹ]  deploying stack "eksctl-bk-cluster-cluster"
2025-04-30 10:54:34 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-cluster"
2025-04-30 10:55:05 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-cluster"
2025-04-30 10:56:05 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-cluster"
2025-04-30 10:57:06 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-cluster"
2025-04-30 10:58:06 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-cluster"
2025-04-30 10:59:06 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-cluster"
2025-04-30 11:00:07 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-cluster"
2025-04-30 11:01:08 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-cluster"
2025-04-30 11:02:08 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-cluster"
2025-04-30 11:02:12 [!]  recommended policies were found for "vpc-cni" addon, but since OIDC is disabled on the cluster, eksctl cannot configure the requested permissions; the recommended way to provide IAM permissions for "vpc-cni" addon is via pod identity associations; after addon creation is completed, add all recommended policies to the config file, under `addon.PodIdentityAssociations`, and run `eksctl update addon`
2025-04-30 11:02:12 [ℹ]  creating addon: vpc-cni
2025-04-30 11:02:12 [ℹ]  successfully created addon: vpc-cni
2025-04-30 11:02:13 [ℹ]  creating addon: kube-proxy
2025-04-30 11:02:13 [ℹ]  successfully created addon: kube-proxy
2025-04-30 11:02:14 [ℹ]  creating addon: coredns
2025-04-30 11:02:14 [ℹ]  successfully created addon: coredns
2025-04-30 11:02:15 [ℹ]  creating addon: metrics-server
2025-04-30 11:02:15 [ℹ]  successfully created addon: metrics-server
2025-04-30 11:04:18 [ℹ]  building iamserviceaccount stack "eksctl-bk-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2025-04-30 11:04:18 [ℹ]  building iamserviceaccount stack "eksctl-bk-cluster-addon-iamserviceaccount-external-dns-external-dns"
2025-04-30 11:04:18 [ℹ]  building iamserviceaccount stack "eksctl-bk-cluster-addon-iamserviceaccount-karpenter-karpenter"
2025-04-30 11:04:18 [ℹ]  building iamserviceaccount stack "eksctl-bk-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2025-04-30 11:04:19 [ℹ]  deploying stack "eksctl-bk-cluster-addon-iamserviceaccount-external-dns-external-dns"
2025-04-30 11:04:19 [ℹ]  deploying stack "eksctl-bk-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2025-04-30 11:04:19 [ℹ]  deploying stack "eksctl-bk-cluster-addon-iamserviceaccount-karpenter-karpenter"
2025-04-30 11:04:19 [ℹ]  deploying stack "eksctl-bk-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2025-04-30 11:04:19 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2025-04-30 11:04:19 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-external-dns-external-dns"
2025-04-30 11:04:19 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-karpenter-karpenter"
2025-04-30 11:04:19 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2025-04-30 11:04:49 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-external-dns-external-dns"
2025-04-30 11:04:49 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2025-04-30 11:04:49 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2025-04-30 11:04:49 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-karpenter-karpenter"
2025-04-30 11:05:22 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-karpenter-karpenter"
2025-04-30 11:05:45 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-external-dns-external-dns"
2025-04-30 11:05:48 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2025-04-30 11:05:50 [ℹ]  addon "vpc-cni" active
2025-04-30 11:05:51 [ℹ]  deploying stack "eksctl-bk-cluster-addon-vpc-cni"
2025-04-30 11:05:51 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-vpc-cni"
2025-04-30 11:06:21 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-vpc-cni"
2025-04-30 11:06:22 [ℹ]  updating addon
2025-04-30 11:06:32 [ℹ]  addon "vpc-cni" active
2025-04-30 11:06:33 [ℹ]  building managed nodegroup stack "eksctl-bk-cluster-nodegroup-main"
2025-04-30 11:06:34 [ℹ]  deploying stack "eksctl-bk-cluster-nodegroup-main"
2025-04-30 11:06:35 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-nodegroup-main"
2025-04-30 11:07:05 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-nodegroup-main"
2025-04-30 11:07:46 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-nodegroup-main"
2025-04-30 11:09:34 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-nodegroup-main"
2025-04-30 11:09:34 [ℹ]  waiting for the control plane to become ready
2025-04-30 11:09:35 [✔]  saved kubeconfig as "/Users/bharathkumardasaraju/.kube/config"
2025-04-30 11:09:35 [ℹ]  no tasks
2025-04-30 11:09:35 [✔]  all EKS cluster resources for "bk-cluster" have been created
2025-04-30 11:09:35 [✔]  created 1 managed nodegroup(s) in cluster "bk-cluster"
2025-04-30 11:09:36 [ℹ]  kubectl command should work with "/Users/bharathkumardasaraju/.kube/config", try 'kubectl get nodes'
2025-04-30 11:09:36 [✔]  EKS cluster "bk-cluster" in "ap-south-1" region is ready
bharathkumardasaraju@11.EKS-revisited$ eksctl utils associate-iam-oidc-provider --region ap-south-1 --cluster bk-cluster --approve
2025-04-30 11:16:31 [ℹ]  IAM Open ID Connect provider is already associated with cluster "bk-cluster" in "ap-south-1"
bharathkumardasaraju@11.EKS-revisited$ kubectl get nodes -o wide
NAME                                              STATUS   ROLES    AGE   VERSION               INTERNAL-IP       EXTERNAL-IP   OS-IMAGE         KERNEL-VERSION                  CONTAINER-RUNTIME
i-03801e5fe3253db8d.ap-south-1.compute.internal   Ready    <none>   12m   v1.32.1-eks-5d632ec   192.168.109.197   <none>        Amazon Linux 2   5.10.235-227.919.amzn2.x86_64   containerd://1.7.27
i-03d11bf1ed91237dc.ap-south-1.compute.internal   Ready    <none>   12m   v1.32.1-eks-5d632ec   192.168.157.117   <none>        Amazon Linux 2   5.10.235-227.919.amzn2.x86_64   containerd://1.7.27
bharathkumardasaraju@11.EKS-revisited$


bharathkumardasaraju@11.EKS-revisited$ kubectl get pods -A -o wide
NAMESPACE     NAME                              READY   STATUS    RESTARTS   AGE    IP                NODE                                              NOMINATED NODE   READINESS GATES
kube-system   aws-node-f2rg4                    2/2     Running   0          163m   192.168.109.197   i-03801e5fe3253db8d.ap-south-1.compute.internal   <none>           <none>
kube-system   aws-node-gqsm7                    2/2     Running   0          163m   192.168.157.117   i-03d11bf1ed91237dc.ap-south-1.compute.internal   <none>           <none>
kube-system   coredns-6799d65cb-2pmlh           1/1     Running   0          169m   192.168.104.137   i-03801e5fe3253db8d.ap-south-1.compute.internal   <none>           <none>
kube-system   coredns-6799d65cb-z9xb9           1/1     Running   0          169m   192.168.151.245   i-03d11bf1ed91237dc.ap-south-1.compute.internal   <none>           <none>
kube-system   eks-pod-identity-agent-7xnbl      1/1     Running   0          152m   192.168.157.117   i-03d11bf1ed91237dc.ap-south-1.compute.internal   <none>           <none>
kube-system   eks-pod-identity-agent-vsfkc      1/1     Running   0          152m   192.168.109.197   i-03801e5fe3253db8d.ap-south-1.compute.internal   <none>           <none>
kube-system   kube-proxy-79kh5                  1/1     Running   0          154m   192.168.109.197   i-03801e5fe3253db8d.ap-south-1.compute.internal   <none>           <none>
kube-system   kube-proxy-v2kl2                  1/1     Running   0          154m   192.168.157.117   i-03d11bf1ed91237dc.ap-south-1.compute.internal   <none>           <none>
kube-system   metrics-server-86b7bc6c76-nlvjd   1/1     Running   0          169m   192.168.97.225    i-03801e5fe3253db8d.ap-south-1.compute.internal   <none>           <none>
kube-system   metrics-server-86b7bc6c76-r9fqx   1/1     Running   0          169m   192.168.130.56    i-03d11bf1ed91237dc.ap-south-1.compute.internal   <none>           <none>
bharathkumardasaraju@11.EKS-revisited$



bharathkumardasaraju@11.EKS-revisited$ eksdemo delete cluster bk-cluster
2025-04-30 13:54:54 [ℹ]  deleting EKS cluster "bk-cluster"
2025-04-30 13:54:55 [ℹ]  will drain 0 unmanaged nodegroup(s) in cluster "bk-cluster"
2025-04-30 13:54:55 [ℹ]  starting parallel draining, max in-flight of 1
2025-04-30 13:54:55 [ℹ]  deleted 0 Fargate profile(s)
2025-04-30 13:54:57 [✔]  kubeconfig has been updated
2025-04-30 13:54:57 [ℹ]  cleaning up AWS load balancers created by Kubernetes objects of Kind Service or Ingress
2025-04-30 13:55:01 [ℹ]
4 sequential tasks: { delete nodegroup "main",
    2 sequential sub-tasks: {
        4 parallel sub-tasks: {
            2 sequential sub-tasks: {
                delete IAM role for serviceaccount "karpenter/karpenter",
                delete serviceaccount "karpenter/karpenter",
            },
            2 sequential sub-tasks: {
                delete IAM role for serviceaccount "kube-system/ebs-csi-controller-sa",
                delete serviceaccount "kube-system/ebs-csi-controller-sa",
            },
            2 sequential sub-tasks: {
                delete IAM role for serviceaccount "awslb/aws-load-balancer-controller",
                delete serviceaccount "awslb/aws-load-balancer-controller",
            },
            2 sequential sub-tasks: {
                delete IAM role for serviceaccount "external-dns/external-dns",
                delete serviceaccount "external-dns/external-dns",
            },
        },
        delete IAM OIDC provider,
    }, delete addon IAM "eksctl-bk-cluster-addon-vpc-cni", delete cluster control plane "bk-cluster" [async]
}
2025-04-30 13:55:01 [ℹ]  will delete stack "eksctl-bk-cluster-nodegroup-main"
2025-04-30 13:55:01 [ℹ]  waiting for stack "eksctl-bk-cluster-nodegroup-main" to get deleted
2025-04-30 13:55:01 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-nodegroup-main"
2025-04-30 13:55:32 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-nodegroup-main"
2025-04-30 13:56:18 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-nodegroup-main"
2025-04-30 13:57:19 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-nodegroup-main"
2025-04-30 13:58:50 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-nodegroup-main"
2025-04-30 13:59:56 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-nodegroup-main"
2025-04-30 14:03:56 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-nodegroup-main"
2025-04-30 14:03:57 [ℹ]  will delete stack "eksctl-bk-cluster-addon-iamserviceaccount-karpenter-karpenter"
2025-04-30 14:03:57 [ℹ]  waiting for stack "eksctl-bk-cluster-addon-iamserviceaccount-karpenter-karpenter" to get deleted
2025-04-30 14:03:57 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-karpenter-karpenter"
2025-04-30 14:03:57 [ℹ]  will delete stack "eksctl-bk-cluster-addon-iamserviceaccount-external-dns-external-dns"
2025-04-30 14:03:57 [ℹ]  waiting for stack "eksctl-bk-cluster-addon-iamserviceaccount-external-dns-external-dns" to get deleted
2025-04-30 14:03:57 [ℹ]  will delete stack "eksctl-bk-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2025-04-30 14:03:57 [ℹ]  waiting for stack "eksctl-bk-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller" to get deleted
2025-04-30 14:03:57 [ℹ]  will delete stack "eksctl-bk-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"
2025-04-30 14:03:57 [ℹ]  waiting for stack "eksctl-bk-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa" to get deleted
2025-04-30 14:03:57 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-external-dns-external-dns"
2025-04-30 14:03:57 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-awslb-aws-load-balancer-controller"
2025-04-30 14:03:57 [ℹ]  waiting for CloudFormation stack "eksctl-bk-cluster-addon-iamserviceaccount-kube-system-ebs-csi-controller-sa"


