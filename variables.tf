variable "create_oidc_provider" {
  description = "Whether or not to create the associated oidc provider. If false, variable 'oidc_provider_arn' is required"
  type        = bool
  default     = true
}

variable "create_oidc_role" {
  description = "Whether or not to create the OIDC attached role"
  type        = bool
  default     = true
}

variable "url" {
  description = "GitLab OpenID TLS certificate URL. The address of your GitLab instance, such as https://gitlab.com or http://gitlab.example.com."
  type        = string
  default     = "https://gitlab.com"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

variable "role_name" {
  description = "(Optional, Forces new resource) Friendly name of the role."
  type        = string
  default     = "gitlab-oidc-provider-aws"
}

variable "role_description" {
  description = "(Optional) Description of the role."
  type        = string
  default     = "Role assumed by the Gitlab OIDC provider."
}

variable "project_paths" {
  description = "List of GitLab namesapce/project names authorized to assume the role."
  type        = list(string)
  default     = []

  validation {
    # Ensures each element of gitlab_projects list matches the
    # namespace/project format used by GitLab.
    condition = length([
      for path in var.project_paths : 1
      if length(regexall("project_path:[A-Za-z0-9_.-]+?/([A-Za-z0-9_.:/-]+|\\*)$", path)) > 0
    ]) == length(var.project_paths)
    error_message = "Projects must be specified in the namespace/project format."
  }
}

variable "max_session_duration" {
  description = "Maximum session duration in seconds."
  type        = number
  default     = 3600

  validation {
    condition     = var.max_session_duration >= 3600 && var.max_session_duration <= 43200
    error_message = "Maximum session duration must be between 3600 and 43200 seconds."
  }
}

variable "oidc_role_attach_policies" {
  description = "Attach policies to OIDC role."
  type        = list(string)
  default     = []
}

variable "match_field" {
  description = "the token field the OIDC provider filter on"
  type        = string
  default     = "sub"
}

variable "gitlab_tls_url" {
  type        = string
  description = "the Hashicorp TLS provider has started following redirects starting v4. so we use tls://"
  # See https://github.com/hashicorp/terraform-provider-tls/issues/249
  default = "tls://gitlab.com:443"
}

variable "aud_value" {
  description = "(Required) A list of client IDs (also known as audiences). When a mobile or web app registers with an OpenID Connect provider, they establish a value that identifies the application. (This is the value that's sent as the client_id parameter on OAuth requests.)"
  type        = list(string)
  default     = ["https://gitlab.com"]
}
