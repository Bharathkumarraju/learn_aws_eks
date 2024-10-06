AWS EKS comes with cloud-controller

New days AWS EKS has load-balancer-controller operator

https://s3.us-west-2.amazonaws.com/amazon-eks/cloudformation/2022-12-23/amazon-eks-nodegroup.yaml



Navigate to the CloudFormation service in AWS Console.
Click on Create Stack drop-down and select with new resources (standard)
In step1 under Prerequisite – Prepare template section select *Choose an existing template*
In specify template section select Amazon S3 URL as the template source.
Use the below s3 URL as the source
https://s3.us-west-2.amazonaws.com/amazon-eks/cloudformation/2022-12-23/amazon-eks-nodegroup.yaml

click on Next .

On the Specify stack details page,
a. Stack name: Enter ‘eks-cluster-stack’ for your AWS CloudFormation stack.
b. ClusterName: Enter ‘demo-eks’ as name that you used when you created your Amazon EKS cluster. This name must be the same as the cluster name or your nodes can’t join the cluster.
c. ClusterControlPlaneSecurityGroup: Choose the security group of the cluster control plane.
d. NodeGroupName: Enter ‘eks-demo-node’ for your node group.
e. NodeImageIdSSMParam: Pre-populated with the Amazon EC2 Systems Manager parameter of a recent Amazon EKS optimized AMI for a variable Kubernetes version. If you want to use version 1.29, you can update the field to /aws/service/eks/optimized-ami/1.29/amazon-linux-2/recommended/image_id
f. KeyName: Select the name of an Amazon EC2 SSH key pair that you can use to connect using SSH into your nodes after they launch.
g. VpcId: Select the VPC as same as the EKS cluster
h. Subnets: Select the subnets as same as EKS cluster (us-east-1a, us-east-1b, us-east-1c).
Note: There are some limitations on the instance size. They are as follows:

Choose one of these instance types: .nano, micro, .small, .medium of t1,t2, and t3 instance class.
Choose the disk type as “gp2” only.
The maximum disk size per node allowed is 30GB.

Select your desired choices on the Configure stack options page and then choose Next

On the box below, stick I acknowledge that AWS CloudFormation might create IAM resources and then choose Submit.


