root@aws-client ~ on ☁️  (us-east-1) ➜  cd ../eks_unmanaged_nodegroups

root@aws-client amazon-elastic-kubernetes-service-course/eks on  main via 💠 default on ☁️  (us-east-1) ➜  terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Finding latest version of hashicorp/local...
- Finding latest version of hashicorp/time...
- Finding latest version of hashicorp/tls...
- Finding latest version of hashicorp/http...
- Installing hashicorp/aws v5.70.0...
- Installed hashicorp/aws v5.70.0 (signed by HashiCorp)
- Installing hashicorp/local v2.5.2...
- Installed hashicorp/local v2.5.2 (signed by HashiCorp)
- Installing hashicorp/time v0.12.1...
- Installed hashicorp/time v0.12.1 (signed by HashiCorp)
- Installing hashicorp/tls v4.0.6...
- Installed hashicorp/tls v4.0.6 (signed by HashiCorp)
- Installing hashicorp/http v3.4.5...
- Installed hashicorp/http v3.4.5 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

root@aws-client amazon-elastic-kubernetes-service-course/eks on  main via 💠 default on ☁️  (us-east-1) ➜  terraform plan
data.http.cloudshell_ip: Reading...
data.http.cloudshell_ip: Read complete after 0s [id=https://checkip.amazonaws.com/]
data.aws_iam_policy_document.assume_role_eks: Reading...
data.aws_vpc.default_vpc: Reading...
data.aws_ssm_parameter.node_ami: Reading...
data.aws_iam_policy_document.assume_role_ec2: Reading...
data.aws_iam_policy_document.assume_role_eks: Read complete after 0s [id=3552664922]
data.aws_iam_policy_document.assume_role_ec2: Read complete after 0s [id=2851119427]
data.aws_ssm_parameter.node_ami: Read complete after 1s [id=/aws/service/eks/optimized-ami/1.29/amazon-linux-2/recommended/image_id]
data.aws_vpc.default_vpc: Read complete after 1s [id=vpc-0c51bbe83eeee0437]
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

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply"
now.

