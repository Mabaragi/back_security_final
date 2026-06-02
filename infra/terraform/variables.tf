variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
  default     = "ap-northeast-2"
}

variable "project_name" {
  description = "Project tag and resource name prefix."
  type        = string
  default     = "cicd03-back-security"
}

variable "github_owner" {
  description = "GitHub repository owner allowed to assume the deploy role."
  type        = string
  default     = "Mabaragi"
}

variable "github_repo" {
  description = "GitHub repository name allowed to assume the deploy role."
  type        = string
  default     = "back_security_final"
}

variable "github_branch" {
  description = "GitHub branch allowed to assume the deploy role."
  type        = string
  default     = "main"
}

variable "ecr_repository_name" {
  description = "ECR repository for the Spring Boot Docker image."
  type        = string
  default     = "jwt-app"
}

variable "instance_type" {
  description = "EC2 instance type for the application host."
  type        = string
  default     = "t3.micro"
}

variable "app_port" {
  description = "Public application port."
  type        = number
  default     = 8080
}
