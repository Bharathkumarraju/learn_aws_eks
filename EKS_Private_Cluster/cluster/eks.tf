data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_iam_session_context" "current" {
  # This data source provides information on the IAM source role of an STS assumed role
  # For non-role ARNs, this data source simply passes the ARN through issuer ARN
  # Ref https://github.com/terraform-aws-modules/terraform-aws-eks/issues/2327#issuecomment-1355581682
  # Ref https://github.com/hashicorp/terraform-provider-aws/issues/28381
  arn = data.aws_caller_identity.current.arn
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name, "--region", local.region]
  }
}

locals{
  name            = "bkr-cluster"
  region          = data.aws_region.current.id
  cluster_version = var.kubernetes_version

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  private_subnets = data.terraform_remote_state.vpc.outputs.private_subnets

  authentication_mode = var.authentication_mode

  tags = {
    environment  = local.name
  }
}

data "aws_iam_role" "eks_admin_role_name" {
  name = var.eks_admin_role_name
}



# The EKS pods directly log to cloudwatch.
resource "aws_iam_policy" "node_cloudwatch_access" {
  name = replace("${var.prefix}-${var.region_prefix}-${var.env}-node-cloudwatch-access", ".", "-")

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:CreateLogGroup",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
          "logs:PutRetentionPolicy",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}



################################################################################
# EKS Cluster
################################################################################
#tfsec:ignore:aws-eks-enable-control-plane-logging
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.8"

  cluster_name                   = local.name
  cluster_version                = local.cluster_version
  cluster_endpoint_public_access = true

  authentication_mode = local.authentication_mode

  kms_key_administrators = distinct(concat([
    "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"],
    [data.aws_iam_session_context.current.issuer_arn]
  ))

  enable_cluster_creator_admin_permissions = true
  access_entries = {
    eks_admin = {
      principal_arn = data.aws_iam_role.eks_admin_role_name.arn
      policy_associations = {
        argocd = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  vpc_id     = local.vpc_id
  subnet_ids = local.private_subnets

  # Node Group Defaults
  self_managed_node_group_defaults = {
    attach_cluster_primary_security_group = true
    create_security_group                 = false

    # Attach additional IAM policies for CloudWatch and SSM
    iam_role_additional_policies = {
      ssm        = aws_iam_policy.eks-ssm-policy.arn
      cloudwatch = aws_iam_policy.node_cloudwatch_access.arn
    }
  }

  # Define the self-managed node groups
  self_managed_node_groups = {
    initial = {
      ami_type        = "BOTTLEROCKET_x86_64"
      name            = replace("bkr-${var.env}", ".", "-")
      instance_types  = ["t3.medium"]
      min_size        = 3
      max_size        = 10
      desired_size    = 3

      # No platform parameter needed; ami_type is enough for Bottlerocket
      enable_bootstrap_user_data = true

      # Bootstrap extra args for Bottlerocket
      bootstrap_extra_args = <<-EOT
        [settings.host-containers.admin]
        enabled = false

        [settings.host-containers.control]
        enabled = true

        [settings.kernel]
        lockdown = "integrity"
      EOT
    }
  }

  cluster_addons = {
    eks-pod-identity-agent = {
      most_recent = true
    }
    vpc-cni = {
      before_compute = true
      most_recent    = true
      configuration_values = jsonencode({
        env = {
          ENABLE_PREFIX_DELEGATION = "true"
          WARM_PREFIX_TARGET       = "1"
        }
      })
    }
  }

  tags = local.tags
}