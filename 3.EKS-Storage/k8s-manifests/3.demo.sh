Static Provisioning of Persistent Volume
Create a pod and PersistentVolume (PV) with static provisioning.

Step 1: Create an EBS volume using AWS CLI:

aws ec2 create-volume --size 10 --region us-east-1 --availability-zone us-east-1a --volume-type gp2

Step 2: Get the volume ID from the output and replace in the following YAML

cat <<EOF | kubectl apply -f -
# Create a PersistentVolume (PV)
apiVersion: v1
kind: PersistentVolume
metadata:
  name: ebs-pv
spec:
  capacity:
    storage: 10Gi
  volumeMode: Filesystem
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: manual
  csi:
    driver: ebs.csi.aws.com
    volumeHandle: <volume-id>
---
# Create a PersistentVolumeClaim (PVC)
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: ebs-pvc
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: manual
  resources:
    requests:
      storage: 10Gi
---
# Create a pod using the PVC
apiVersion: v1
kind: Pod
metadata:
  name: ebs-pod
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
      claimName: ebs-pvc
EOF




Create a Default Storage Class
Create a default storage class for dynamic provisioning.


cat <<EOF | kubectl apply -f -
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


Create Pod to Use new Storage Class
Create new PVC to use the default storage class and deploy new pod.



cat <<EOF | kubectl apply -f -
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
