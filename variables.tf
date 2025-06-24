variable "github_organization" {
  description = "GitHub organization for GHA OIDC bound_audiences and subject claim."
  type        = string
}

variable "github_repositories" {
  description = "List of GitHub repositories for bound_claims.sub."
  type        = list(string)
}

variable "vault_namespace_path" {
  description = "Vault namespace for resources."
  type        = string
}

variable "jwt_backend_path" {
  description = "Path to the Vault JWT auth backend."
  type        = string
}
