bharathkumardasaraju@11.EKS-revisited$ kubectl auth can-i list pods --all-namespaces
yes
bharathkumardasaraju@11.EKS-revisited$ kubectl config view --minify
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://A3414BD089E3BB9A460EAB692DDB29E5.gr7.ap-south-1.eks.amazonaws.com
  name: bkdev.ap-south-1.eksctl.io
contexts:
- context:
    cluster: bkdev.ap-south-1.eksctl.io
    user: bharath@bkdev.ap-south-1.eksctl.io
  name: bharath@bkdev.ap-south-1.eksctl.io
current-context: bharath@bkdev.ap-south-1.eksctl.io
kind: Config
preferences: {}
users:
- name: bharath@bkdev.ap-south-1.eksctl.io
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      args:
      - token
      - -i
      - bkdev
      command: aws-iam-authenticator
      env:
      - name: AWS_STS_REGIONAL_ENDPOINTS
        value: regional
      - name: AWS_DEFAULT_REGION
        value: ap-south-1
      interactiveMode: IfAvailable
      provideClusterInfo: false
bharathkumardasaraju@11.EKS-revisited$ git add .
bharathkumardasaraju@11.EKS-revisited$


