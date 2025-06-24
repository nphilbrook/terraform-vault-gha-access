
resource "vault_jwt_auth_backend_role" "gha_role" {
  namespace = var.vault_namespace_path
  backend   = var.jwt_backend_path

  role_name         = var.role_name
  bound_audiences   = ["https://github.com/${var.github_organization}"]
  bound_claims_type = "glob"
  bound_claims = {
    sub                = join(",", [for repo in var.github_repositories : "repo:${var.github_organization}/${repo}:ref:*"])
    workflow           = var.workflow
    runner_environment = "self-hosted"
  }
  user_claim     = "sub"
  role_type      = "jwt"
  token_ttl      = 300
  token_type     = "service"
  token_policies = [vault_policy.gha_policy.name]
}

resource "vault_policy" "gha_policy" {
  namespace = var.vault_namespace_path
  name      = "${var.role_name}-policy"
  policy    = data.vault_policy_document.gha_policy.hcl
}

data "vault_policy_document" "gha_policy" {
  rule {
    path         = "prod/kv/*"
    capabilities = ["read"]
    description  = "Read prod kv secrets"
  }

  rule {
    path         = "nonprod/kv/*"
    capabilities = ["read"]
    description  = "Read nonprod kv secrets"
  }
}

