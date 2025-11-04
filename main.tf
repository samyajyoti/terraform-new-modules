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


