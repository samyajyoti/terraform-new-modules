output "node_role_arn" {
  value       = aws_iam_role.node_role.arn
  description = "ARN of the Karpenter Node IAM Role"
}

output "controller_role_arn" {
  value       = aws_iam_role.controller_role.arn
  description = "ARN of the Karpenter Controller IAM Role"
}

