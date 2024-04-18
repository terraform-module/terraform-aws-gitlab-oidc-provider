# AWS GitLab OIDC Provider Terraform Module

This module allows you to create an AWS IAM OIDC provider that trusts GitLab and the associated IAM roles, that will help GitLab Pipelines to securely authenticate against the AWS API using an IAM role.

We recommend using GitLab's OIDC issuer to get short-lived credentials needed for your pipelines. Specifying role-to-assume without providing an aws-access-key-id or a web-identity-token-file will signal to the pipeline that you wish to use the OIDC provider. The default session duration is 1 hour when using the OIDC provider to directly assume an IAM Role. The default session duration is 6 hours when using an IAM User to assume an IAM Role (by providing an aws-access-key-id, aws-secret-access-key, and a role-to-assume) . If you would like to adjust this you can pass a duration to role-duration-seconds, but the duration cannot exceed the maximum that was defined when the IAM Role was created. The default session name is `GitLabPipeline`, and you can modify it by specifying the desired name in role-session-name.

## Use-Cases

1. Retrieve temporary credentials from AWS to access cloud services
1. Use credentials to retrieve secrets or deploy to an environment
1. Scope role to branch or project
1. Create an AWS OIDC provider for GitLab Pipelines

## Features

2. Create one or more IAM role that can be assumed by GitLab Pipelines
3. IAM roles can be scoped to :
     * One or more GitLab namespaces
     * One or more GitLab project
     * One or more branches in a project

| Feature                                                                                                | Status |
|--------------------------------------------------------------------------------------------------------|--------|
| Create a role for all projects in a specific GitLab namespace                                          | ✅     |
| Create a role specific to a project for a specific namespace                                           | ✅     |
| Create a role specific to a branch in a project                                                        | ✅     |
| Create a role for multiple namespaces/projects/branches                                                | ✅     |
| Create a role for namesapces/projectss/branches selected by wildcard (e.g. `feature/*` branches)       | ✅     |

---

[![linter](https://github.com/terraform-module/terraform-aws-gitlab-oidc-provider/actions/workflows/linter.yml/badge.svg)](https://github.com/terraform-module/terraform-aws-gitlab-oidc-provider/actions/workflows/linter.yml)
[![release.draft](https://github.com/terraform-module/terraform-aws-gitlab-oidc-provider/actions/workflows/release.draft.yml/badge.svg)](https://github.com/terraform-module/terraform-aws-gitlab-oidc-provider/actions/workflows/release.draft.yml)

[![](https://img.shields.io/github/license/terraform-module/terraform-aws-gitlab-oidc-provider)](https://github.com/terraform-module/terraform-aws-gitlab-oidc-provider)
![](https://img.shields.io/github/v/tag/terraform-module/terraform-aws-gitlab-oidc-provider)
![](https://img.shields.io/issues/github/terraform-module/terraform-aws-gitlab-oidc-provider)
![](https://img.shields.io/github/issues/terraform-module/terraform-aws-gitlab-oidc-provider)
![](https://img.shields.io/github/issues-closed/terraform-module/terraform-aws-gitlab-oidc-provider)
[![](https://img.shields.io/github/languages/code-size/terraform-module/terraform-aws-gitlab-oidc-provider)](https://github.com/terraform-module/terraform-aws-gitlab-oidc-provider)
[![](https://img.shields.io/github/repo-size/terraform-module/terraform-aws-gitlab-oidc-provider)](https://github.com/terraform-module/terraform-aws-gitlab-oidc-provider)
![](https://img.shields.io/github/languages/top/terraform-module/terraform-aws-gitlab-oidc-provider?color=green&logo=terraform&logoColor=blue)
![](https://img.shields.io/github/commit-activity/m/terraform-module/terraform-aws-gitlab-oidc-provider)
![](https://img.shields.io/github/contributors/terraform-module/terraform-aws-gitlab-oidc-provider)
![](https://img.shields.io/github/last-commit/terraform-module/terraform-aws-gitlab-oidc-provider)
[![Maintenance](https://img.shields.io/badge/Maintenu%3F-oui-green.svg)](https://GitHub.com/terraform-module/terraform-aws-gitlab-oidc-provider/graphs/commit-activity)
[![GitHub forks](https://img.shields.io/github/forks/terraform-module/terraform-aws-gitlab-oidc-provider.svg?style=social&label=Fork)](https://github.com/terraform-module/terraform-aws-gitlab-oidc-provider)

---

## Documentation

- [TFLint Rules](https://github.com/terraform-linters/tflint/tree/master/docs/rules)

## Usage example

IMPORTANT: The master branch is used in source just as an example. In your code, do not pin to master because there may be breaking changes between releases. Instead pin to the release tag (e.g. ?ref=tags/x.y.z) of one of our [latest releases](https://github.com/terraform-module/terraform-aws-gitlab-oidc-provider/releases).

```hcl
module "gitlab_oidc" {
  source  = "terraform-module/gitlab-oidc-provider/aws"
  version = "~> 1"

  create_oidc_provider = true
  create_oidc_role     = true

  project_paths             = ["project_path:terraform-module/module-blueprint", "project_path:foo/bar"]
  oidc_role_attach_policies = ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"]
}
```

## Examples

See `examples` directory for working examples to reference

- [Examples TFM Dir](https://github.com/terraform-module/terraform-aws-gitlab-oidc-provider)
- [Examples Gitlab Pipeline](./gitlab/)

## Assumptions

## Available features

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# AWS Gitlab OIDC Provider Terraform Module

## Purpose
This module allows you to create a Gitlab OIDC provider for your AWS account, that will allow Gitlab pipelines to securely authenticate against the AWS API using an IAM role

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.40 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.40 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [tls_certificate.gitlab](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aud_value"></a> [aud\_value](#input\_aud\_value) | (Required) A list of client IDs (also known as audiences). When a mobile or web app registers with an OpenID Connect provider, they establish a value that identifies the application. (This is the value that's sent as the client\_id parameter on OAuth requests.) | `list(string)` | <pre>[<br>  "https://gitlab.com"<br>]</pre> | no |
| <a name="input_create_oidc_provider"></a> [create\_oidc\_provider](#input\_create\_oidc\_provider) | Whether or not to create the associated oidc provider. If false, variable 'oidc\_provider\_arn' is required | `bool` | `true` | no |
| <a name="input_create_oidc_role"></a> [create\_oidc\_role](#input\_create\_oidc\_role) | Whether or not to create the OIDC attached role | `bool` | `true` | no |
| <a name="input_gitlab_tls_url"></a> [gitlab\_tls\_url](#input\_gitlab\_tls\_url) | the Hashicorp TLS provider has started following redirects starting v4. so we use tls:// | `string` | `"tls://gitlab.com:443"` | no |
| <a name="input_match_field"></a> [match\_field](#input\_match\_field) | the token field the OIDC provider filter on | `string` | `"sub"` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Maximum session duration in seconds. | `number` | `3600` | no |
| <a name="input_oidc_role_attach_policies"></a> [oidc\_role\_attach\_policies](#input\_oidc\_role\_attach\_policies) | Attach policies to OIDC role. | `list(string)` | `[]` | no |
| <a name="input_projects"></a> [projects](#input\_projects) | List of GitLab namesapce/project names authorized to assume the role. | `list(string)` | `[]` | no |
| <a name="input_role_description"></a> [role\_description](#input\_role\_description) | (Optional) Description of the role. | `string` | `"Role assumed by the Gitlab OIDC provider."` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | (Optional, Forces new resource) Friendly name of the role. | `string` | `"gitlab-oidc-provider-aws"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| <a name="input_url"></a> [url](#input\_url) | GitLab OpenID TLS certificate URL. The address of your GitLab instance, such as https://gitlab.com or http://gitlab.example.com. | `string` | `"https://gitlab.com"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oidc_provider_arn"></a> [oidc\_provider\_arn](#output\_oidc\_provider\_arn) | OIDC provider ARN |
| <a name="output_oidc_role"></a> [oidc\_role](#output\_oidc\_role) | CICD GitHub role. |
| <a name="output_policy_document"></a> [policy\_document](#output\_policy\_document) | joined IAM policy documents |
| <a name="output_thumbprint"></a> [thumbprint](#output\_thumbprint) | TLS endpoint certificate SHA1 Fingerprint |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


### :memo: Guidelines

 - :memo: Use a succinct title and description.
 - :bug: Bugs & feature requests can be be opened
 - :signal_strength: Support questions are better asked on [Stack Overflow](https://stackoverflow.com/)
 - :blush: Be nice, civil and polite ([as always](http://contributor-covenant.org/version/1/4/)).

## License

Copyright 2019 Ivan Katliarhcuk

MIT Licensed. See [LICENSE](./LICENSE) for full details.

## How to Contribute

Submit a pull request

# Authors

Currently maintained by [Ivan Katliarchuk](https://github.com/ivankatliarchuk) and these [awesome contributors](https://github.com/terraform-module/terraform-aws-gitlab-oidc-provider/graphs/contributors).

[![ForTheBadge uses-git](http://ForTheBadge.com/images/badges/uses-git.svg)](https://GitHub.com/)

## Terraform Registry

- [Module](https://registry.terraform.io/modules/terraform-module/gitlab-oidc-provider/aws/latest)

## Resources

- [AWS: create oidc](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc.html)
- [Blog: OIDC with AWS and GitLab](https://oblcc.com/blog/configure-openid-connect-for-gitlab-and-aws/)
- [Blog: Gitlab OIDC](https://docs.gitlab.com/ee/ci/cloud_services/aws/)
- [Tfm: OIDC Gitlab](https://gitlab.com/guided-explorations/aws/configure-openid-connect-in-aws/)

## Clone Me

[**Create a repository using this template →**][template.generate]

<!-- resources -->
[template.generate]: https://github.com/terraform-module/terraform-aws-gitlab-oidc-provider/generate


<!-- https://github.com/moritzheiber/terraform-aws-oidc-github-actions-module -->
