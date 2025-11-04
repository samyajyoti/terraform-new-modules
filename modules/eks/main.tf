provider "aws" {
  region = var.region
}

resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn
  version  = "1.32"

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  # Enable KMS encryption for secrets (optional)
  dynamic "encryption_config" {
    for_each = var.kms_key_arn != "" ? [1] : []
    content {
      resources = ["secrets"]
      provider {
        key_arn = var.kms_key_arn
      }
    }
  }

  tags = {
    Name = var.cluster_name
  }
}

#######ADD Nodegroup###########

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }
 # Use Bottlerocket ARM AMI directly
  ami_type       = "BOTTLEROCKET_ARM_64"
  capacity_type = var.use_spot_instances ? "SPOT" : "ON_DEMAND"
  instance_types = var.node_instance_types
  remote_access {
    ec2_ssh_key = var.key_name  # optional, if you want SSH
  }


}

