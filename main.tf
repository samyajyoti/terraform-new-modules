terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.30"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.11"
    }
  }
  required_version = ">= 1.3"
}

module "eks_cluster" {
  source       = "./modules/eks"
  region       = "us-east-2"
  cluster_name = "test-terraform-cluster"
  subnet_ids   = ["subnet-01a7ca5ae890e088c", "subnet-0cafa7e0c2c9b7441"]
  kms_key_arn  = "arn:aws:kms:us-east-2:231322554539:key/ea38f676-3a26-4eb5-8902-7ddf3e797ca3"
  cluster_role_arn = "arn:aws:iam::231322554539:role/eks-cluster-role-ohio-new"
  node_group_name = "testing-ng"
  node_role_arn = "arn:aws:iam::231322554539:role/KarpenterNodeRole-eks-uat"
  desired_size = "2"
  min_size = "1"
  max_size = "2"
  node_instance_types = ["t4g.medium", "r6g.medium" ]
  key_name = "ohio"
}

# --- Install Karpenter ---

#module "karpenter" {
#  source = "./modules/karpenter"
#
#  cluster_name        = "test-terraform-cluster"
#  cluster_endpoint    = module.eks_cluster.cluster_endpoint
#  oidc_provider_arn   = module.eks_cluster.oidc_provider_arn
#  region              = "us-east-2"
#  subnet_ids          = ["subnet-01a7ca5ae890e088c", "subnet-0cafa7e0c2c9b7441"]
#
#  providers = {
#    aws        = aws
#    kubernetes = kubernetes
#    helm       = helm
#  }
#
#}

module "karpenter_iam" {
  source          = "./modules/karpenter-iam"
  cluster_name    = "test-terraform-cluster"
  aws_account_id  = "231322554539"
  aws_region      = "us-east-2"
  oidc_provider_arn   = module.eks_cluster.oidc_provider_arn
  oidc_endpoint   = module.eks_cluster.oidc_url
}

