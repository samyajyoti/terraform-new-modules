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
variable "cluster_role_arn" {
  description = "Existing IAM role ARN for EKS cluster"
  type        = string
}

#######NODEGROUP########
variable "use_spot_instances" {
  description = "Whether to use spot instances"
  type        = bool
  default     = true
}

variable "arm_instance_types" {
  description = "ARM instance types for Graviton nodes"
  type        = list(string)
  default     = ["t4g.medium"]
}

variable "bottlerocket_version" {
  description = "Bottlerocket AMI version (optional)"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "SSH key for EC2 nodes (optional)"
  type        = string
  default     = ""
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  default     = "default-ng"
}

variable "node_role_arn" {
  description = "IAM role ARN for the node group"
  type        = string
}

variable "desired_size" {
  description = "Desired size of the node group"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum size of the node group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size of the node group"
  type        = number
  default     = 3
}

variable "node_instance_types" {
  description = "List of instance types for the node group"
  type        = list(string)
  default     = ["t3.medium"]
}
