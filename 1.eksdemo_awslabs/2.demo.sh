bharathkumardasaraju@learn_aws_eks$ aws ssm start-session --target i-00b6efdab721276a7

SessionManagerPlugin is not found. Please refer to SessionManager Documentation here: http://docs.aws.amazon.com/console/systems-manager/session-manager-plugin-not-found
bharathkumardasaraju@learn_aws_eks$ brew install session-manager-plugin

==> Downloading https://session-manager-downloads.s3.amazonaws.com/plugin/1.2.650.0/mac_arm64/session-manager-plugin.pkg
####################################################################################################################################################################################################################### 100.0%
==> Installing Cask session-manager-plugin
==> Running installer for session-manager-plugin with sudo; the password may be necessary.
Password:
installer: Package name is session-manager-plugin
installer: Installing at base path /
installer: The install was successful.
==> Linking Binary 'session-manager-plugin' to '/opt/homebrew/bin/session-manager-plugin'
🍺  session-manager-plugin was successfully installed!
bharathkumardasaraju@learn_aws_eks$ aws ssm start-session --target i-00b6efdab721276a7

Starting session with SessionId: bharath-e4bpglslppxrbxusoqailbyt3y
sh-4.2$ sudo su
[root@i-00b6efdab721276a7 bin]# cd /etc/cni/
[root@i-00b6efdab721276a7 cni]# ls -rtlh
total 0
drwx------ 2 root root 29 Oct  4 22:32 net.d
[root@i-00b6efdab721276a7 cni]# cd net.d
[root@i-00b6efdab721276a7 net.d]# ls -rtlh
total 4.0K
-rw-r--r-- 1 root root 906 Oct  4 22:32 10-aws.conflist
[root@i-00b6efdab721276a7 net.d]# cat 10-aws.conflist 10-aws.conflist
{
  "cniVersion": "0.4.0",
  "name": "aws-cni",
  "disableCheck": true,
  "plugins": [
    {
      "name": "aws-cni",
      "type": "aws-cni",
      "vethPrefix": "eni",
      "mtu": "9001",
      "podSGEnforcingMode": "strict",
      "pluginLogFile": "/var/log/aws-routed-eni/plugin.log",
      "pluginLogLevel": "DEBUG"
    },
    {
      "name": "egress-cni",
      "type": "egress-cni",
      "mtu": "9001",
      "enabled": "false",
      "randomizeSNAT": "prng",
      "nodeIP": "",
      "ipam": {
         "type": "host-local",
         "ranges": [[{"subnet": "fd00::ac:00/118"}]],
         "routes": [{"dst": "::/0"}],
         "dataDir": "/run/cni/v4pd/egress-v6-ipam"
      },
      "pluginLogFile": "/var/log/aws-routed-eni/egress-v6-plugin.log",
      "pluginLogLevel": "DEBUG"
    },
    {
      "type": "portmap",
      "capabilities": {"portMappings": true},
      "snat": true
    }
  ]
}
{
  "cniVersion": "0.4.0",
  "name": "aws-cni",
  "disableCheck": true,
  "plugins": [
    {
      "name": "aws-cni",
      "type": "aws-cni",
      "vethPrefix": "eni",
      "mtu": "9001",
      "podSGEnforcingMode": "strict",
      "pluginLogFile": "/var/log/aws-routed-eni/plugin.log",
      "pluginLogLevel": "DEBUG"
    },
    {
      "name": "egress-cni",
      "type": "egress-cni",
      "mtu": "9001",
      "enabled": "false",
      "randomizeSNAT": "prng",
      "nodeIP": "",
      "ipam": {
         "type": "host-local",
         "ranges": [[{"subnet": "fd00::ac:00/118"}]],
         "routes": [{"dst": "::/0"}],
         "dataDir": "/run/cni/v4pd/egress-v6-ipam"
      },
      "pluginLogFile": "/var/log/aws-routed-eni/egress-v6-plugin.log",
      "pluginLogLevel": "DEBUG"
    },
    {
      "type": "portmap",
      "capabilities": {"portMappings": true},
      "snat": true
    }
  ]
}
[root@i-00b6efdab721276a7 net.d]#




bharathkumardasaraju@learn_aws_eks$ kubectl get nodes -o wide
NAME                                             STATUS   ROLES    AGE   VERSION               INTERNAL-IP       EXTERNAL-IP   OS-IMAGE         KERNEL-VERSION                  CONTAINER-RUNTIME
i-00b6efdab721276a7.eu-west-2.compute.internal   Ready    <none>   30m   v1.30.4-eks-a737599   192.168.189.64    <none>        Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
i-0ffa54f6cb76122e1.eu-west-2.compute.internal   Ready    <none>   30m   v1.30.4-eks-a737599   192.168.100.135   <none>        Amazon Linux 2   5.10.225-213.878.amzn2.x86_64   containerd://1.7.11
bharathkumardasaraju@learn_aws_eks$ kubectl get pods -A
NAMESPACE     NAME                      READY   STATUS    RESTARTS   AGE
kube-system   aws-node-8n775            2/2     Running   0          30m
kube-system   aws-node-j9l2w            2/2     Running   0          30m
kube-system   coredns-c7bbdfbb8-88t6w   1/1     Running   0          36m
kube-system   coredns-c7bbdfbb8-zvncd   1/1     Running   0          36m
kube-system   kube-proxy-4pxnf          1/1     Running   0          30m
kube-system   kube-proxy-hf49s          1/1     Running   0          30m
bharathkumardasaraju@learn_aws_eks$ kubectl get pods -A -o wide
NAMESPACE     NAME                      READY   STATUS    RESTARTS   AGE   IP                NODE                                             NOMINATED NODE   READINESS GATES
kube-system   aws-node-8n775            2/2     Running   0          30m   192.168.189.64    i-00b6efdab721276a7.eu-west-2.compute.internal   <none>           <none>
kube-system   aws-node-j9l2w            2/2     Running   0          30m   192.168.100.135   i-0ffa54f6cb76122e1.eu-west-2.compute.internal   <none>           <none>
kube-system   coredns-c7bbdfbb8-88t6w   1/1     Running   0          36m   192.168.106.46    i-0ffa54f6cb76122e1.eu-west-2.compute.internal   <none>           <none>
kube-system   coredns-c7bbdfbb8-zvncd   1/1     Running   0          36m   192.168.187.250   i-00b6efdab721276a7.eu-west-2.compute.internal   <none>           <none>
kube-system   kube-proxy-4pxnf          1/1     Running   0          30m   192.168.100.135   i-0ffa54f6cb76122e1.eu-west-2.compute.internal   <none>           <none>
kube-system   kube-proxy-hf49s          1/1     Running   0          30m   192.168.189.64    i-00b6efdab721276a7.eu-west-2.compute.internal   <none>           <none>
bharathkumardasaraju@learn_aws_eks$

