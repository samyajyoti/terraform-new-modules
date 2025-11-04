module "eks_cluster" {
  source       = "./modules/eks"
  region       = "us-east-2"
  cluster_name = "test-terraform-cluster"
  subnet_ids   = ["subnet-04457da64d3a88158", "subnet-0958640cdbcfead6c"]
  kms_key_arn  = "arn:aws:kms:us-east-2:231322554539:key/ea38f676-3a26-4eb5-8902-7ddf3e797ca3"
}


