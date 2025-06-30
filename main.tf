locals {
  create_policy = length(var.read_paths) > 0 || length(var.write_paths) > 0
}

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
  token_policies = local.create_policy ? [vault_policy.gha_policy[0].name] : null
}

resource "vault_policy" "gha_policy" {
  namespace = var.vault_namespace_path
  count     = local.create_policy ? 1 : 0
  name      = "${var.role_name}-policy"
  policy    = data.vault_policy_document.gha_policy.hcl
}

data "vault_policy_document" "gha_policy" {
  dynamic "rule" {
    for_each = var.read_paths
    content {
      path         = rule.value
      capabilities = ["read"]
      description  = "Read access to ${rule.value}"
    }
  }

  dynamic "rule" {
    for_each = var.write_paths
    content {
      path         = rule.value
      capabilities = ["create", "read", "update", "delete"]
      description  = "Write access to ${rule.value}"
    }
  }
}

