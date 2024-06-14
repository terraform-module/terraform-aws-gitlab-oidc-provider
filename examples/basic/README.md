# Example

Configuration in this directory creates an AWS IAM OpenID Connect Provider, IAM Role and IAM Role Policy for trusing the OIDC provider.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gitlab_oidc"></a> [gitlab\_oidc](#module\_gitlab\_oidc) | ../.. | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oidc_provider_arn"></a> [oidc\_provider\_arn](#output\_oidc\_provider\_arn) | OIDC provider ARN |
| <a name="output_oidc_role"></a> [oidc\_role](#output\_oidc\_role) | CICD GiLab role. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
