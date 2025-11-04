module "eks_cluster" {
  source       = "./modules/eks"
  region       = "us-east-2"
  cluster_name = "test-terraform-cluster"
  subnet_ids   = ["subnet-04457da64d3a88158", "subnet-0958640cdbcfead6c"]
}


