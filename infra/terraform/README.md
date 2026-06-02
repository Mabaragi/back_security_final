# Terraform CI/CD Infrastructure

This directory provisions the AWS resources used by GitHub Actions:

- ECR repository `jwt-app`
- EC2 app host in the default VPC
- EC2 instance profile for SSM and ECR pull
- GitHub Actions OIDC deploy role for `Mabaragi/back_security_final`

Apply from this directory:

```powershell
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
```

If Terraform cannot read AWS CLI `login` credentials directly, export a temporary session into the current PowerShell before `plan` or `apply`:

```powershell
$creds = aws configure export-credentials --format process | ConvertFrom-Json
$env:AWS_ACCESS_KEY_ID = $creds.AccessKeyId
$env:AWS_SECRET_ACCESS_KEY = $creds.SecretAccessKey
$env:AWS_SESSION_TOKEN = $creds.SessionToken
```

Required GitHub repository secrets:

- `SPRING_JWT_SECRET`
- `MYSQL_ROOT_PASSWORD`
- `MYSQL_DATABASE`
- `MYSQL_USER`
- `MYSQL_PASSWORD`

After `terraform apply`, push to `main` or run the `CI/CD Pipeline` workflow manually.
