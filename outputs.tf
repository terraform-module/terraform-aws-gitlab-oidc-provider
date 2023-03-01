output "oidc_provider_arn" {
  description = "OIDC provider ARN"
  value       = try(aws_iam_openid_connect_provider.this[0].arn, "")
}

output "oidc_role" {
  description = "CICD GitHub role."
  value       = try(aws_iam_role.this[0].arn, "")
}

output "thumbprint" {
  description = "TLS endpoint certificate SHA1 Fingerprint"
  value = [data.tls_certificate.gitlab.certificates[0].sha1_fingerprint]
}

output "policy_document" {
  value = join("", data.aws_iam_policy_document.this.*.json)
}
