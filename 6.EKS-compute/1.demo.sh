EKS Compute and Scaling

EKS Fargate is serverless

EKS Unmanaged-nodegroups are like - I just have this autoscaling group and i want to talk to that EKS cluster and it would scale up and down.
But all of the work  to
  1. To create the Autoscaling group - ASG
  2. To put the node inplace - Node Placement
  3. Make sure Kubelet can join the right eks cluster  - Kubelet Clustering
  4. The IAM Credentials to do all the steps


Unmanaged-NodeGroup - that is literally just create an autoscaling group that can connect to the endpoint EKS-API with correct IAM Credentials. Its a lot of work, thats why managed nodegroups exist.



