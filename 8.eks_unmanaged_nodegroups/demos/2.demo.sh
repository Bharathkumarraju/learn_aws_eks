root@aws-client amazon-elastic-kubernetes-service-course/eks on  main via 💠 default on ☁️  (us-east-1) ➜  terraform apply --auto-approve
data.http.cloudshell_ip: Reading...
data.http.cloudshell_ip: Read complete after 0s [id=https://checkip.amazonaws.com/]
data.aws_ssm_parameter.node_ami: Reading...
data.aws_vpc.default_vpc: Reading...
data.aws_iam_policy_document.assume_role_ec2: Reading...
data.aws_iam_policy_document.assume_role_eks: Reading...
data.aws_iam_policy_document.assume_role_ec2: Read complete after 0s [id=2851119427]
data.aws_iam_policy_document.assume_role_eks: Read complete after 0s [id=3552664922]
data.aws_ssm_parameter.node_ami: Read complete after 0s [id=/aws/service/eks/optimized-ami/1.29/amazon-linux-2/recommended/image_id]
data.aws_vpc.default_vpc: Read complete after 0s [id=vpc-0c51bbe83eeee0437]
data.aws_subnets.public: Reading...
data.aws_subnets.public: Read complete after 0s [id=us-east-1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
 <= read (data resources)

Terraform will perform the following actions:

  # data.aws_eks_cluster.deme_eks will be read during apply
  # (depends on a resource or a module with changes pending)
 <= data "aws_eks_cluster" "deme_eks" {
      + access_config             = (known after apply)
      + arn                       = (known after apply)
      + certificate_authority     = (known after apply)
      + cluster_id                = (known after apply)
      + created_at                = (known after apply)
      + enabled_cluster_log_types = (known after apply)
      + endpoint                  = (known after apply)
      + id                        = (known after apply)
      + identity                  = (known after apply)
      + kubernetes_network_config = (known after apply)
      + name                      = "demo-eks"
      + outpost_config            = (known after apply)
      + platform_version          = (known after apply)
      + role_arn                  = (known after apply)
      + status                    = (known after apply)
      + tags                      = (known after apply)
      + upgrade_policy            = (known after apply)
      + version                   = (known after apply)
      + vpc_config                = (known after apply)
    }

  # aws_cloudformation_stack.autoscaling_group will be created
  + resource "aws_cloudformation_stack" "autoscaling_group" {
      + id            = (known after apply)
      + name          = "eks-cluster-stack"
      + outputs       = (known after apply)
      + parameters    = (known after apply)
      + policy_body   = (known after apply)
      + tags_all      = {
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
      + template_body = (known after apply)
    }

  # aws_eks_cluster.demo_eks will be created
  + resource "aws_eks_cluster" "demo_eks" {
      + arn                           = (known after apply)
      + bootstrap_self_managed_addons = true
      + certificate_authority         = (known after apply)
      + cluster_id                    = (known after apply)
      + created_at                    = (known after apply)
      + endpoint                      = (known after apply)
      + id                            = (known after apply)
      + identity                      = (known after apply)
      + name                          = "demo-eks"
      + platform_version              = (known after apply)
      + role_arn                      = (known after apply)
      + status                        = (known after apply)
      + tags_all                      = {
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
      + version                       = (known after apply)

      + vpc_config {
          + cluster_security_group_id = (known after apply)
          + endpoint_private_access   = false
          + endpoint_public_access    = true
          + public_access_cidrs       = (known after apply)
          + subnet_ids                = [
              + "subnet-06235c31f58b32aa9",
              + "subnet-092cbfdc4b3af5b89",
              + "subnet-0d34ab0f2309f3f20",
            ]
          + vpc_id                    = (known after apply)
        }
    }

  # aws_iam_instance_profile.node_instance_profile will be created
  + resource "aws_iam_instance_profile" "node_instance_profile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = "NodeInstanceProfile"
      + name_prefix = (known after apply)
      + path        = "/"
      + role        = (known after apply)
      + tags_all    = {
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
      + unique_id   = (known after apply)
    }

  # aws_iam_role.demo_eks will be created
  + resource "aws_iam_role" "demo_eks" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "eks.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "eksClusterRole"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = {
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
      + unique_id             = (known after apply)
    }

  # aws_iam_role.node_instance_role will be created
  + resource "aws_iam_role" "node_instance_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = [
          + "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
          + "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
          + "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
          + "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
        ]
      + max_session_duration  = 3600
      + name                  = "eks-demo-node"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = {
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
      + unique_id             = (known after apply)
    }

  # aws_iam_role_policy_attachment.demo_eks_AmazonEKSClusterPolicy will be created
  + resource "aws_iam_role_policy_attachment" "demo_eks_AmazonEKSClusterPolicy" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
      + role       = "eksClusterRole"
    }

  # aws_iam_role_policy_attachment.demo_eks_AmazonEKSVPCResourceController will be created
  + resource "aws_iam_role_policy_attachment" "demo_eks_AmazonEKSVPCResourceController" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
      + role       = "eksClusterRole"
    }

  # aws_key_pair.eks_kp will be created
  + resource "aws_key_pair" "eks_kp" {
      + arn             = (known after apply)
      + fingerprint     = (known after apply)
      + id              = (known after apply)
      + key_name        = "eks_kp"
      + key_name_prefix = (known after apply)
      + key_pair_id     = (known after apply)
      + key_type        = (known after apply)
      + public_key      = (known after apply)
      + tags_all        = {
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
    }

  # aws_launch_template.node_launch_template will be created
  + resource "aws_launch_template" "node_launch_template" {
      + arn                    = (known after apply)
      + default_version        = (known after apply)
      + id                     = (known after apply)
      + image_id               = (sensitive value)
      + instance_type          = "t3.medium"
      + key_name               = "eks_kp"
      + latest_version         = (known after apply)
      + name                   = "NodeLaunchTemplate"
      + name_prefix            = (known after apply)
      + tags                   = {
          + "Name" = "NodeLaunchTemplate"
        }
      + tags_all               = {
          + "Name"                           = "NodeLaunchTemplate"
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
      + user_data              = "ICAgICMhL2Jpbi9iYXNoCiAgICBzZXQgLW8geHRyYWNlCiAgICAvZXRjL2Vrcy9ib290c3RyYXAuc2ggZGVtby1la3MKICAgIC9vcHQvYXdzL2Jpbi9jZm4tc2lnbmFsIC0tZXhpdC1jb2RlICQ/IFwKICAgICAgICAgICAgICAgIC0tc3RhY2sgIGRlbW8tZWtzLXN0YWNrIFwKICAgICAgICAgICAgICAgIC0tcmVzb3VyY2UgTm9kZUdyb3VwICBcCiAgICAgICAgICAgICAgICAtLXJlZ2lvbiB1cy1lYXN0LTEK"
      + vpc_security_group_ids = (known after apply)

      + block_device_mappings {
          + device_name = "/dev/xvda"

          + ebs {
              + delete_on_termination = "true"
              + iops                  = (known after apply)
              + throughput            = (known after apply)
              + volume_size           = 30
              + volume_type           = "gp2"
            }
        }

      + iam_instance_profile {
          + name = "NodeInstanceProfile"
        }

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = (known after apply)
          + http_put_response_hop_limit = 2
          + http_tokens                 = "optional"
          + instance_metadata_tags      = (known after apply)
        }

      + tag_specifications {
          + resource_type = "instance"
          + tags          = {
              + "Name" = "worker-node"
            }
        }
    }

  # aws_security_group.node_security_group will be created
  + resource "aws_security_group" "node_security_group" {
      + arn                    = (known after apply)
      + description            = "Security group for all nodes in the cluster"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "NodeSecurityGroupIngress"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "NodeSecurityGroupIngress"
        }
      + tags_all               = {
          + "Name"                           = "NodeSecurityGroupIngress"
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
      + vpc_id                 = "vpc-0c51bbe83eeee0437"
    }

  # aws_vpc_security_group_egress_rule.control_plane_egress_to_node_security_group will be created
  + resource "aws_vpc_security_group_egress_rule" "control_plane_egress_to_node_security_group" {
      + arn                          = (known after apply)
      + description                  = "Allow the cluster control plane to communicate with worker Kubelet and pods"
      + from_port                    = 1025
      + id                           = (known after apply)
      + ip_protocol                  = "TCP"
      + referenced_security_group_id = (known after apply)
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
      + to_port                      = 65535
    }

  # aws_vpc_security_group_egress_rule.control_plane_egress_to_node_security_group_on_443 will be created
  + resource "aws_vpc_security_group_egress_rule" "control_plane_egress_to_node_security_group_on_443" {
      + arn                          = (known after apply)
      + description                  = "Allow the cluster control plane to communicate with pods running extension API servers on port 443"
      + from_port                    = 443
      + id                           = (known after apply)
      + ip_protocol                  = "TCP"
      + referenced_security_group_id = (known after apply)
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
      + to_port                      = 443
    }

  # aws_vpc_security_group_egress_rule.node_egress_all will be created
  + resource "aws_vpc_security_group_egress_rule" "node_egress_all" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "0.0.0.0/0"
      + description            = "Allow node egress to anywhere"
      + id                     = (known after apply)
      + ip_protocol            = "-1"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags_all               = {
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
    }

  # aws_vpc_security_group_ingress_rule.cluster_control_plane_security_group_ingress will be created
  + resource "aws_vpc_security_group_ingress_rule" "cluster_control_plane_security_group_ingress" {
      + arn                          = (known after apply)
      + description                  = "Allow pods to communicate with the cluster API Server"
      + from_port                    = 443
      + id                           = (known after apply)
      + ip_protocol                  = "TCP"
      + referenced_security_group_id = (known after apply)
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
      + to_port                      = 443
    }

  # aws_vpc_security_group_ingress_rule.control_plane_egress_to_node_security_group_on_443 will be created
  + resource "aws_vpc_security_group_ingress_rule" "control_plane_egress_to_node_security_group_on_443" {
      + arn                          = (known after apply)
      + description                  = "Allow pods running extension API servers on port 443 to receive communication from cluster control plane"
      + from_port                    = 443
      + id                           = (known after apply)
      + ip_protocol                  = "TCP"
      + referenced_security_group_id = (known after apply)
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
      + to_port                      = 443
    }

  # aws_vpc_security_group_ingress_rule.node_security_group_from_control_plane_ingress will be created
  + resource "aws_vpc_security_group_ingress_rule" "node_security_group_from_control_plane_ingress" {
      + arn                          = (known after apply)
      + description                  = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
      + from_port                    = 1025
      + id                           = (known after apply)
      + ip_protocol                  = "TCP"
      + referenced_security_group_id = (known after apply)
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
      + to_port                      = 65535
    }

  # aws_vpc_security_group_ingress_rule.node_security_group_ingress will be created
  + resource "aws_vpc_security_group_ingress_rule" "node_security_group_ingress" {
      + arn                          = (known after apply)
      + description                  = "Allow node to communicate with each other"
      + id                           = (known after apply)
      + ip_protocol                  = "-1"
      + referenced_security_group_id = (known after apply)
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {
          + "kubernetes.io/cluster/demo-eks" = "owned"
        }
    }

  # local_sensitive_file.pem_file will be created
  + resource "local_sensitive_file" "pem_file" {
      + content              = (sensitive value)
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0700"
      + file_permission      = "600"
      + filename             = "/root/.ssh/eks-aws.pem"
      + id                   = (known after apply)
    }

  # time_sleep.wait_30_seconds will be created
  + resource "time_sleep" "wait_30_seconds" {
      + create_duration = "30s"
      + id              = (known after apply)
    }

  # tls_private_key.key_pair will be created
  + resource "tls_private_key" "key_pair" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

Plan: 20 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + NodeAutoScalingGroup = (known after apply)
  + NodeInstanceRole     = (known after apply)
  + NodeSecurityGroup    = (known after apply)
tls_private_key.key_pair: Creating...
aws_iam_role.demo_eks: Creating...
aws_iam_role.node_instance_role: Creating...
aws_security_group.node_security_group: Creating...
aws_iam_role.demo_eks: Creation complete after 0s [id=eksClusterRole]
aws_iam_role_policy_attachment.demo_eks_AmazonEKSClusterPolicy: Creating...
aws_iam_role_policy_attachment.demo_eks_AmazonEKSVPCResourceController: Creating...
aws_iam_role_policy_attachment.demo_eks_AmazonEKSVPCResourceController: Creation complete after 1s [id=eksClusterRole-20241008223154596100000001]
aws_iam_role_policy_attachment.demo_eks_AmazonEKSClusterPolicy: Creation complete after 1s [id=eksClusterRole-20241008223154599900000002]
aws_eks_cluster.demo_eks: Creating...
aws_iam_role.node_instance_role: Creation complete after 1s [id=eks-demo-node]
aws_iam_instance_profile.node_instance_profile: Creating...
tls_private_key.key_pair: Creation complete after 1s [id=f0bcba21eb48a14b7dea49147bea3af611904c5f]
aws_key_pair.eks_kp: Creating...
local_sensitive_file.pem_file: Creating...
local_sensitive_file.pem_file: Creation complete after 0s [id=6447574f0eec004bfaa3be9e4b540e3bae18c2e3]
aws_iam_instance_profile.node_instance_profile: Creation complete after 0s [id=NodeInstanceProfile]
aws_key_pair.eks_kp: Creation complete after 1s [id=eks_kp]
aws_security_group.node_security_group: Creation complete after 2s [id=sg-0aeaef671bfaa250a]
aws_vpc_security_group_ingress_rule.node_security_group_ingress: Creating...
aws_vpc_security_group_egress_rule.node_egress_all: Creating...
aws_launch_template.node_launch_template: Creating...
aws_launch_template.node_launch_template: Creation complete after 0s [id=lt-052f810bab40a7da6]
time_sleep.wait_30_seconds: Creating...
aws_vpc_security_group_ingress_rule.node_security_group_ingress: Creation complete after 0s [id=sgr-03b80b0b73290dd6c]
aws_vpc_security_group_egress_rule.node_egress_all: Creation complete after 0s [id=sgr-04851aa9d7068ae88]
aws_eks_cluster.demo_eks: Still creating... [10s elapsed]
time_sleep.wait_30_seconds: Still creating... [10s elapsed]
aws_eks_cluster.demo_eks: Still creating... [20s elapsed]
time_sleep.wait_30_seconds: Still creating... [20s elapsed]
aws_eks_cluster.demo_eks: Still creating... [30s elapsed]
time_sleep.wait_30_seconds: Still creating... [30s elapsed]
time_sleep.wait_30_seconds: Creation complete after 30s [id=2024-10-08T22:32:26Z]
aws_cloudformation_stack.autoscaling_group: Creating...
aws_eks_cluster.demo_eks: Still creating... [40s elapsed]
aws_cloudformation_stack.autoscaling_group: Still creating... [10s elapsed]
aws_eks_cluster.demo_eks: Still creating... [50s elapsed]
aws_cloudformation_stack.autoscaling_group: Still creating... [20s elapsed]
aws_eks_cluster.demo_eks: Still creating... [1m0s elapsed]
aws_cloudformation_stack.autoscaling_group: Still creating... [30s elapsed]
aws_cloudformation_stack.autoscaling_group: Creation complete after 36s [id=arn:aws:cloudformation:us-east-1:730335639260:stack/eks-cluster-stack/31e5ccd0-85c5-11ef-891d-12ded033cd8f]
aws_eks_cluster.demo_eks: Still creating... [1m10s elapsed]
aws_eks_cluster.demo_eks: Still creating... [1m20s elapsed]
aws_eks_cluster.demo_eks: Still creating... [7m10s elapsed]
aws_eks_cluster.demo_eks: Still creating... [7m20s elapsed]
aws_eks_cluster.demo_eks: Still creating... [7m30s elapsed]
aws_eks_cluster.demo_eks: Creation complete after 7m34s [id=demo-eks]
data.aws_eks_cluster.deme_eks: Reading...
data.aws_eks_cluster.deme_eks: Read complete after 0s [id=demo-eks]
aws_vpc_security_group_ingress_rule.node_security_group_from_control_plane_ingress: Creating...
aws_vpc_security_group_egress_rule.control_plane_egress_to_node_security_group: Creating...
aws_vpc_security_group_ingress_rule.cluster_control_plane_security_group_ingress: Creating...
aws_vpc_security_group_ingress_rule.control_plane_egress_to_node_security_group_on_443: Creating...
aws_vpc_security_group_egress_rule.control_plane_egress_to_node_security_group_on_443: Creating...
aws_vpc_security_group_ingress_rule.cluster_control_plane_security_group_ingress: Creation complete after 0s [id=sgr-033f836975586e84a]
aws_vpc_security_group_ingress_rule.control_plane_egress_to_node_security_group_on_443: Creation complete after 0s [id=sgr-029bfe100986027cd]
aws_vpc_security_group_egress_rule.control_plane_egress_to_node_security_group_on_443: Creation complete after 0s [id=sgr-018bdc35860ae9863]
aws_vpc_security_group_ingress_rule.node_security_group_from_control_plane_ingress: Creation complete after 0s [id=sgr-039a4395ad4816766]
aws_vpc_security_group_egress_rule.control_plane_egress_to_node_security_group: Creation complete after 0s [id=sgr-03c24cdb422e4c9ab]

Apply complete! Resources: 20 added, 0 changed, 0 destroyed.

Outputs:

NodeAutoScalingGroup = "eks-cluster-stack-NodeGroup-jytpjeUSvijw"
NodeInstanceRole = "arn:aws:iam::730335639260:role/eks-demo-node"
NodeSecurityGroup = "sg-0aeaef671bfaa250a"
