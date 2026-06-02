output "aws_account_id" {
  description = "AWS account ID."
  value       = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  description = "AWS region."
  value       = var.aws_region
}

output "ecr_repository_url" {
  description = "ECR repository URL for the app image."
  value       = aws_ecr_repository.app.repository_url
}

output "github_actions_role_arn" {
  description = "IAM role ARN assumed by GitHub Actions through OIDC."
  value       = aws_iam_role.github_actions.arn
}

output "instance_id" {
  description = "EC2 instance ID used as the SSM deployment target."
  value       = aws_instance.app.id
}

output "public_ip" {
  description = "EC2 public IP."
  value       = aws_instance.app.public_ip
}

output "test_url" {
  description = "Public endpoint used by the deployment workflow for verification."
  value       = "http://${aws_instance.app.public_ip}:${var.app_port}/test"
}
