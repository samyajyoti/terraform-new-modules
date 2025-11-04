variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "test-eks-terraform"
}

variable "vpc_id" {
  description = "VPC ID for EKS"
  type        = string
  default = "vpc-08d130cfb5cb2cf93"
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
  default  =   ["subnet-0958640cdbcfead6c", "subnet-04457da64d3a88158"]
}
variable "kms_key_arn" {
  description = "KMS key ARN for EKS secrets encryption"
  type        = string
  default     = ""
}
