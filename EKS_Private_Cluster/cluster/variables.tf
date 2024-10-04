variable "kubernetes_version" {
  description = "EKS version"
  type        = string
  default     = "1.30"
}

variable "eks_admin_role_name" {
  description = "EKS admin role"
  type        = string
  default     = "bharathadmin"
}

variable "addons" {
  description = "EKS addons"
  type        = any
  default = {
    enable_aws_load_balancer_controller = false
    enable_aws_argocd = false
  }
}

variable "authentication_mode" {
  description = "The authentication mode for the cluster. Valid values are CONFIG_MAP, API or API_AND_CONFIG_MAP"
  type        = string
  default     = "API_AND_CONFIG_MAP"
}

variable "env" {
  default = "test"
}


variable "prefix" {
  description = "Naming scheme prefix"
  type        = string
  default     = "bkr"
}

variable "region" {
  description = "Target AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "region_prefix" {
  description = "Region prefix using for naming"
  type        = string
  default     = "euw"
}