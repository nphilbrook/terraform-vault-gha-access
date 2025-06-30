variable "github_organization" {
  description = "GitHub organization for GHA OIDC bound_audiences and subject claim."
  type        = string
}

variable "github_repositories" {
  description = "List of GitHub repositories for the bound_claims subject. Globs are allowed."
  type        = list(string)
}

variable "vault_namespace_path" {
  description = "Vault namespace for resources."
  type        = string
  default     = null
}

variable "jwt_backend_path" {
  description = "Path to the Vault JWT auth backend."
  type        = string
}

variable "workflow" {
  description = "GitHub Actions workflow name for bound_claims.workflow. If null, any workflow will be authorized."
  type        = string
  default     = null
}

variable "role_name" {
  description = "Name of the Vault JWT auth backend role. Must be unique within the JWT backend."
  type        = string
}

variable "read_paths" {
  description = "List of Vault paths for read access. Each path should include wildcards as needed (e.g., 'prod/kv/*')."
  type        = list(string)
  default     = []
}

variable "write_paths" {
  description = "List of Vault paths for write access. Each path should include wildcards as needed (e.g., 'nonprod/kv/*')."
  type        = list(string)
  default     = []
}
