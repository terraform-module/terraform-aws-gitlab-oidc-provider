terraform {
  required_version = ">= 1.0"
}

################################################################################
# Resources
################################################################################

module "gitlab_oidc" {
  source = "../.."

  create_oidc_provider = true
  create_oidc_role     = true

  project_paths             = ["project_path:terraform-module/terraform-aws-gitlab-oidc-provider"]
  oidc_role_attach_policies = ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"]
}

################################################################################
# OUTPUTS
################################################################################

output "oidc_provider_arn" {
  description = "OIDC provider ARN"
  value       = module.gitlab-oidc.oidc_provider_arn
}

output "oidc_role" {
  description = "CICD GiLab role."
  value       = module.gitlab-oidc.oidc_role
}
