variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "aws_partition" {
  description = "AWS partition, e.g., aws, aws-cn"
  type        = string
  default     = "aws"
}

variable "aws_account_id" {
  description = "AWS account ID"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "oidc_endpoint" {
  description = "OIDC endpoint for EKS cluster"
  type        = string
}
variable "oidc_provider_arn" {
  type        = string
  description = "OIDC provider ARN for IAM trust"
}
variable "karpenter_namespace" {
  description = "Namespace where Karpenter is installed"
  type        = string
  default     = "karpenter"
}

