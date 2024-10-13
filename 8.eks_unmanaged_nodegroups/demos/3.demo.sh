Apply complete! Resources: 20 added, 0 changed, 0 destroyed.

Outputs:

NodeAutoScalingGroup = "eks-cluster-stack-NodeGroup-jytpjeUSvijw"
NodeInstanceRole = "arn:aws:iam::730335639260:role/eks-demo-node"
NodeSecurityGroup = "sg-0aeaef671bfaa250a"



aws eks update-kubeconfig --region us-east-1 --name demo-eks


curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/cloudformation/2020-10-29/aws-auth-cm.yaml



root@aws-client ~ on ☁️  (us-east-1) ➜  cat amazon-elastic-kubernetes-service-course/eks/aws-auth-cm.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: arn:aws:iam::730335639260:role/eks-demo-node
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes

root@aws-client ~ on ☁️  (us-east-1) ➜




root@aws-client ~ on ☁️  (us-east-1) ➜  kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://C22F67FC2499081B5C7953598FB2D526.gr7.us-east-1.eks.amazonaws.com
  name: arn:aws:eks:us-east-1:730335639260:cluster/demo-eks
contexts:
- context:
    cluster: arn:aws:eks:us-east-1:730335639260:cluster/demo-eks
    user: arn:aws:eks:us-east-1:730335639260:cluster/demo-eks
  name: arn:aws:eks:us-east-1:730335639260:cluster/demo-eks
current-context: arn:aws:eks:us-east-1:730335639260:cluster/demo-eks
kind: Config
preferences: {}
users:
- name: arn:aws:eks:us-east-1:730335639260:cluster/demo-eks
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      args:
      - --region
      - us-east-1
      - eks
      - get-token
      - --cluster-name
      - demo-eks
      - --output
      - json
      command: aws
      env: null
      interactiveMode: IfAvailable
      provideClusterInfo: false

root@aws-client ~ on ☁️  (us-east-1) ➜  kubectl config view --minify
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://C22F67FC2499081B5C7953598FB2D526.gr7.us-east-1.eks.amazonaws.com
  name: arn:aws:eks:us-east-1:730335639260:cluster/demo-eks
contexts:
- context:
    cluster: arn:aws:eks:us-east-1:730335639260:cluster/demo-eks
    user: arn:aws:eks:us-east-1:730335639260:cluster/demo-eks
  name: arn:aws:eks:us-east-1:730335639260:cluster/demo-eks
current-context: arn:aws:eks:us-east-1:730335639260:cluster/demo-eks
kind: Config
preferences: {}
users:
- name: arn:aws:eks:us-east-1:730335639260:cluster/demo-eks
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      args:
      - --region
      - us-east-1
      - eks
      - get-token
      - --cluster-name
      - demo-eks
      - --output
      - json
      command: aws
      env: null
      interactiveMode: IfAvailable
      provideClusterInfo: false

root@aws-client ~ on ☁️  (us-east-1) ➜  kubectl get pods -A
NAMESPACE     NAME                       READY   STATUS    RESTARTS   AGE
kube-system   aws-node-h2cbg             2/2     Running   0          5m51s
kube-system   aws-node-nnzbh             2/2     Running   0          5m47s
kube-system   aws-node-q4zwm             2/2     Running   0          5m50s
kube-system   coredns-586b798467-5hh2h   1/1     Running   0          10m
kube-system   coredns-586b798467-v6tzp   1/1     Running   0          10m
kube-system   kube-proxy-brbjg           1/1     Running   0          5m50s
kube-system   kube-proxy-mnb7w           1/1     Running   0          5m47s
kube-system   kube-proxy-x5xm7           1/1     Running   0          5m51s

root@aws-client ~



root@aws-client ~ on ☁️  (us-east-1) ➜  aws iam create-user --user-name iamuser-eksuser
{
    "User": {
        "Path": "/",
        "UserName": "iamuser-eksuser",
        "UserId": "AIDA2UC3FO3OMQDTL3GGM",
        "Arn": "arn:aws:iam::730335639260:user/iamuser-eksuser",
        "CreateDate": "2024-10-08T22:50:20Z"
    }
}

root@aws-client ~ on ☁️  (us-east-1) ➜  aws iam create-access-key --user-name iamuser-eksuser | tee /tmp/create_output.json
{
    "AccessKey": {
        "UserName": "iamuser-eksuser",
        "AccessKeyId": "AKIA2UC3FO3OESV2QHVP",
        "Status": "Active",
        "SecretAccessKey": "7EANs43itDlb83sfndsdfosafrhonvcnvowierfowejfipwfhowndlkfno",
        "CreateDate": "2024-10-08T22:50:29Z"
    }
}

root@aws-client ~ on ☁️  (us-east-1) ➜



root@aws-client ~ on ☁️  (us-east-1) ➜  vim amazon-elastic-kubernetes-service-course/eks/aws-auth-cm.yaml

root@aws-client ~ on ☁️  (us-east-1) ➜  kubectl apply -f amazon-elastic-kubernetes-service-course/eks/aws-auth-cm.yaml
configmap/aws-auth configured

root@aws-client ~ on ☁️  (us-east-1) ➜     kubectl auth can-i get pod --as iamuser-eksuser
no

root@aws-client ~ on ☁️  (us-east-1) ✖ cat amazon-elastic-kubernetes-service-course/eks/aws-auth-cm.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: arn:aws:iam::730335639260:role/eks-demo-node
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
  mapUsers: |
    - userarn: arn:aws:iam::730335639260:user/iamuser-eksuser
      username: iamuser-eksuser

root@aws-client ~ on ☁️  (us-east-1) ➜


root@aws-client ~ on ☁️  (us-east-1) ➜  cat user-role.yaml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: iamuser-eks-role
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["list", "get", "watch"]
- apiGroups: ["extensions", "apps"]
  resources: ["deployments"]
  verbs: ["get", "list", "watch"]

root@aws-client ~ on ☁️  (us-east-1) ➜  cat user-role-binding.yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: iamuser-eks-binding
subjects:
- kind: User
  name: iamuser-eksuser
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: iamuser-eks-role
  apiGroup: rbac.authorization.k8s.io

root@aws-client ~ on ☁️  (us-east-1) ➜  kubectl auth can-i get pod --as iamuser-eksuser
yes

root@aws-client ~ on ☁️  (us-east-1) ➜