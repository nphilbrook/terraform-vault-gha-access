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
