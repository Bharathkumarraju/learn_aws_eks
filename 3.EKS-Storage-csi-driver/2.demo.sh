Give NodeInstance Role an EBS access fully.

Install EBS-CSI driver helm chart


helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver


bharathkumardasaraju@git$ helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver

"aws-ebs-csi-driver" already exists with the same configuration, skipping
bharathkumardasaraju@git$ helm install aws-ebs-csi-driver aws-ebs-csi-driver/aws-ebs-csi-driver \
  --namespace kube-system \
  --set image.repository=602401143452.dkr.ecr.eu-west-2.amazonaws.com/eks/aws-ebs-csi-driver \
  --set controller.serviceAccount.create=true \
  --set controller.serviceAccount.name=ebs-csi-controller-sa \
  --set node.serviceAccount.create=true \
  --set node.serviceAccount.name=ebs-csi-node-sa

NAME: aws-ebs-csi-driver
LAST DEPLOYED: Sun Oct  6 06:32:07 2024
NAMESPACE: kube-system
STATUS: deployed
REVISION: 1
NOTES:
To verify that aws-ebs-csi-driver has started, run:

    kubectl get pod -n kube-system -l "app.kubernetes.io/name=aws-ebs-csi-driver,app.kubernetes.io/instance=aws-ebs-csi-driver"

NOTE: The [CSI Snapshotter](https://github.com/kubernetes-csi/external-snapshotter) controller and CRDs will no longer be installed as part of this chart and moving forward will be a prerequisite of using the snap shotting functionality.
bharathkumardasaraju@git$

bharathkumardasaraju@git$ kubectl get pods -n kube-system
NAME                                 READY   STATUS    RESTARTS   AGE
aws-node-jf8tv                       2/2     Running   0          63m
aws-node-lmmqx                       2/2     Running   0          63m
coredns-c7bbdfbb8-nnff2              1/1     Running   0          69m
coredns-c7bbdfbb8-x89vp              1/1     Running   0          69m
ebs-csi-controller-f85b445cf-c47tr   5/5     Running   0          24s
ebs-csi-controller-f85b445cf-h49jh   5/5     Running   0          24s
ebs-csi-node-qw4vx                   3/3     Running   0          24s
ebs-csi-node-rx6rb                   3/3     Running   0          24s
kube-proxy-pdwbp                     1/1     Running   0          63m
kube-proxy-zzsr9                     1/1     Running   0          63m
bharathkumardasaraju@git$



bharathkumardasaraju@git$ aws eks describe-nodegroup --cluster-name hanumans-eks --nodegroup-name main

{
    "nodegroup": {
        "nodegroupName": "main",
        "nodegroupArn": "arn:aws:eks:eu-west-2:172586632398:nodegroup/hanumans-eks/main/84c92f4a-4646-6245-274b-2233349c4c2d",
        "clusterName": "hanumans-eks",
        "version": "1.30",
        "releaseVersion": "ami-096da6485ead207a0",
        "createdAt": "2024-10-06T05:27:28.811000+08:00",
        "modifiedAt": "2024-10-06T06:28:25.710000+08:00",
        "status": "ACTIVE",
        "capacityType": "ON_DEMAND",
        "scalingConfig": {
            "minSize": 0,
            "maxSize": 10,
            "desiredSize": 2
        },
        "instanceTypes": [
            "t3.medium"
        ],
        "subnets": [
            "subnet-0bb816148fca5ca2d",
            "subnet-0d8fa96fffbd140db",
            "subnet-0cdb43d6be023dca1"
        ],
        "amiType": "CUSTOM",
        "nodeRole": "arn:aws:iam::172586632398:role/eksctl-hanumans-eks-nodegroup-main-NodeInstanceRole-RglJtT2GMRzu",
        "labels": {
            "alpha.eksctl.io/cluster-name": "hanumans-eks",
            "alpha.eksctl.io/nodegroup-name": "main"
        },
        "resources": {
            "autoScalingGroups": [
                {
                    "name": "eks-main-84c92f4a-4646-6245-274b-2233349c4c2d"
                }
            ]
        },
        "health": {
            "issues": []
        },
        "updateConfig": {
            "maxUnavailable": 1
        },
        "launchTemplate": {
            "name": "eksctl-hanumans-eks-nodegroup-main",
            "version": "1",
            "id": "lt-017825c2332e61554"
        },
        "tags": {
            "aws:cloudformation:stack-name": "eksctl-hanumans-eks-nodegroup-main",
            "alpha.eksctl.io/cluster-name": "hanumans-eks",
            "alpha.eksctl.io/nodegroup-name": "main",
            "aws:cloudformation:stack-id": "arn:aws:cloudformation:eu-west-2:172586632398:stack/eksctl-hanumans-eks-nodegroup-main/91caf0b0-8360-11ef-8202-0285b66f702f",
            "eksdemo.io/version": "0.16.0",
            "eksctl.cluster.k8s.io/v1alpha1/cluster-name": "hanumans-eks",
            "aws:cloudformation:logical-id": "ManagedNodeGroup",
            "alpha.eksctl.io/nodegroup-type": "managed",
            "alpha.eksctl.io/eksctl-version": "0.191.0"
        }
    }
}
bharathkumardasaraju@git$ aws iam attach-role-policy \
    --role-name eksctl-hanumans-eks-nodegroup-main-NodeInstanceRole-RglJtT2GMRzu \
    --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess

bharathkumardasaraju@git$

Once done create a storage-class

bharathkumardasaraju@git$ cat <<EOF | kubectl apply -f -
# Create a StorageClass
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: ebs-sc
  annotations:
    storageclass.kubernetes.io/is-default-class: "true"
provisioner: ebs.csi.aws.com
parameters:
  type: gp2
  fsType: ext4
EOF
storageclass.storage.k8s.io/ebs-sc created
bharathkumardasaraju@git$


and then create the pod with persistentVolumeClaim like below.

bharathkumardasaraju@git$ cat <<EOF | kubectl apply -f -
# PVC
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: ebs-pvc-new
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: ebs-sc
  resources:
    requests:
      storage: 10Gi
---
# Re-deploy pod
apiVersion: v1
kind: Pod
metadata:
  name: ebs-pod-new
spec:
  containers:
  - name: app
    image: busybox
    command: [ "sh", "-c", "echo Hello Kubernetes! && sleep 3600" ]
    volumeMounts:
    - mountPath: "/data"
      name: ebs-storage
  volumes:
  - name: ebs-storage
    persistentVolumeClaim:
      claimName: ebs-pvc-new
EOF
persistentvolumeclaim/ebs-pvc-new created
pod/ebs-pod-new created
bharathkumardasaraju@git$







bharathkumardasaraju@git$ kubectl describe pvc ebs-pvc-new
Name:          ebs-pvc-new
Namespace:     default
StorageClass:  ebs-sc
Status:        Bound
Volume:        pvc-5215c989-b0e6-4fb3-925d-5ef1345e5859
Labels:        <none>
Annotations:   pv.kubernetes.io/bind-completed: yes
               pv.kubernetes.io/bound-by-controller: yes
               volume.beta.kubernetes.io/storage-provisioner: ebs.csi.aws.com
               volume.kubernetes.io/storage-provisioner: ebs.csi.aws.com
Finalizers:    [kubernetes.io/pvc-protection]
Capacity:      10Gi
Access Modes:  RWO
VolumeMode:    Filesystem
Used By:       ebs-pod-new
Events:
  Type    Reason                 Age                From                                                                                     Message
  ----    ------                 ----               ----                                                                                     -------
  Normal  ExternalProvisioning   86s (x2 over 86s)  persistentvolume-controller                                                              Waiting for a volume to be created either by the external provisioner 'ebs.csi.aws.com' or manually by the system administrator. If volume creation is delayed, please verify that the provisioner is running and correctly registered.
  Normal  Provisioning           86s                ebs.csi.aws.com_ebs-csi-controller-f85b445cf-h49jh_390beaf4-4f53-42df-b62a-0dbd6f56da87  External provisioner is provisioning volume for claim "default/ebs-pvc-new"
  Normal  ProvisioningSucceeded  84s                ebs.csi.aws.com_ebs-csi-controller-f85b445cf-h49jh_390beaf4-4f53-42df-b62a-0dbd6f56da87  Successfully provisioned volume pvc-5215c989-b0e6-4fb3-925d-5ef1345e5859
bharathkumardasaraju@git$




bharathkumardasaraju@git$ kubectl describe pvc ebs-pvc-new
Name:          ebs-pvc-new
Namespace:     default
StorageClass:  ebs-sc
Status:        Bound
Volume:        pvc-5215c989-b0e6-4fb3-925d-5ef1345e5859
Labels:        <none>
Annotations:   pv.kubernetes.io/bind-completed: yes
               pv.kubernetes.io/bound-by-controller: yes
               volume.beta.kubernetes.io/storage-provisioner: ebs.csi.aws.com
               volume.kubernetes.io/storage-provisioner: ebs.csi.aws.com
Finalizers:    [kubernetes.io/pvc-protection]
Capacity:      10Gi
Access Modes:  RWO
VolumeMode:    Filesystem
Used By:       ebs-pod-new
Events:
  Type    Reason                 Age                From                                                                                     Message
  ----    ------                 ----               ----                                                                                     -------
  Normal  ExternalProvisioning   86s (x2 over 86s)  persistentvolume-controller                                                              Waiting for a volume to be created either by the external provisioner 'ebs.csi.aws.com' or manually by the system administrator. If volume creation is delayed, please verify that the provisioner is running and correctly registered.
  Normal  Provisioning           86s                ebs.csi.aws.com_ebs-csi-controller-f85b445cf-h49jh_390beaf4-4f53-42df-b62a-0dbd6f56da87  External provisioner is provisioning volume for claim "default/ebs-pvc-new"
  Normal  ProvisioningSucceeded  84s                ebs.csi.aws.com_ebs-csi-controller-f85b445cf-h49jh_390beaf4-4f53-42df-b62a-0dbd6f56da87  Successfully provisioned volume pvc-5215c989-b0e6-4fb3-925d-5ef1345e5859
bharathkumardasaraju@git$
bharathkumardasaraju@git$ kubectl get pvc ebs-pvc-new  -o wide
NAME          STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   VOLUMEATTRIBUTESCLASS   AGE     VOLUMEMODE
ebs-pvc-new   Bound    pvc-5215c989-b0e6-4fb3-925d-5ef1345e5859   10Gi       RWO            ebs-sc         <unset>                 5m53s   Filesystem
bharathkumardasaraju@git$

bharathkumardasaraju@git$

bharathkumardasaraju@git$ kubectl get pv  -o wide
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                 STORAGECLASS   VOLUMEATTRIBUTESCLASS   REASON   AGE    VOLUMEMODE
pvc-5215c989-b0e6-4fb3-925d-5ef1345e5859   10Gi       RWO            Delete           Bound    default/ebs-pvc-new   ebs-sc         <unset>                          6m4s   Filesystem
bharathkumardasaraju@git$
bharathkumardasaraju@git$ kubectl describe pv pvc-5215c989-b0e6-4fb3-925d-5ef1345e5859
Name:              pvc-5215c989-b0e6-4fb3-925d-5ef1345e5859
Labels:            <none>
Annotations:       pv.kubernetes.io/provisioned-by: ebs.csi.aws.com
                   volume.kubernetes.io/provisioner-deletion-secret-name:
                   volume.kubernetes.io/provisioner-deletion-secret-namespace:
Finalizers:        [external-provisioner.volume.kubernetes.io/finalizer kubernetes.io/pv-protection external-attacher/ebs-csi-aws-com]
StorageClass:      ebs-sc
Status:            Bound
Claim:             default/ebs-pvc-new
Reclaim Policy:    Delete
Access Modes:      RWO
VolumeMode:        Filesystem
Capacity:          10Gi
Node Affinity:
  Required Terms:
    Term 0:        topology.kubernetes.io/zone in [eu-west-2a]
Message:
Source:
    Type:              CSI (a Container Storage Interface (CSI) volume source)
    Driver:            ebs.csi.aws.com
    FSType:            ext4
    VolumeHandle:      vol-05a341a77ef8a51f7
    ReadOnly:          false
    VolumeAttributes:      storage.kubernetes.io/csiProvisionerIdentity=1728167539632-8220-ebs.csi.aws.com
Events:                <none>
bharathkumardasaraju@git$



bharathkumardasaraju@git$ kubectl get sc
NAME               PROVISIONER             RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
ebs-sc (default)   ebs.csi.aws.com         Delete          Immediate              false                  25m
gp2                kubernetes.io/aws-ebs   Delete          WaitForFirstConsumer   false                  105m
bharathkumardasaraju@git$ kubectl get sc ebs-sc -o wide
NAME               PROVISIONER       RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
ebs-sc (default)   ebs.csi.aws.com   Delete          Immediate           false                  25m
bharathkumardasaraju@git$ kubectl get sc ebs-sc -o yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"storage.k8s.io/v1","kind":"StorageClass","metadata":{"annotations":{"storageclass.kubernetes.io/is-default-class":"true"},"name":"ebs-sc"},"parameters":{"fsType":"ext4","type":"gp2"},"provisioner":"ebs.csi.aws.com"}
    storageclass.kubernetes.io/is-default-class: "true"
  creationTimestamp: "2024-10-05T22:40:10Z"
  name: ebs-sc
  resourceVersion: "16356"
  uid: b95ad78b-a28b-4a9b-b31c-aaa9a51b7794
parameters:
  fsType: ext4
  type: gp2
provisioner: ebs.csi.aws.com
reclaimPolicy: Delete
volumeBindingMode: Immediate
bharathkumardasaraju@git$

