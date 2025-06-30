# terraform-vault-gha-access

This module creates a Vault JWT auth backend role and associated policy for GitHub Actions authentication. The policy allows configurable read and write access to Vault paths.

## Usage

```hcl
module "gha_access" {
  source              = "app.terraform.io/BigCorp/gha-access/vault"
  version             = "1.0.3"

  github_organization = "my-org"
  github_repositories = ["my-repo", "another-repo"]
  jwt_backend_path    = "jwt"
  role_name           = "github-actions-role"
  
  read_paths = [
    "prod/kv/*",
    "shared/kv/database/*"
  ]
  
  write_paths = [
    "nonprod/kv/*",
    "temp/kv/*"
  ]
  
  vault_namespace_path = "admin/my-namespace"
  workflow            = "deploy.yml"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.8 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 4.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | >= 4.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_jwt_auth_backend_role.gha_role](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend_role) | resource |
| [vault_policy.gha_policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy_document.gha_policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | GitHub organization for GHA OIDC bound\_audiences and subject claim. | `string` | n/a | yes |
| <a name="input_github_repositories"></a> [github\_repositories](#input\_github\_repositories) | List of GitHub repositories for the bound\_claims subject. Globs are allowed. | `list(string)` | n/a | yes |
| <a name="input_jwt_backend_path"></a> [jwt\_backend\_path](#input\_jwt\_backend\_path) | Path to the Vault JWT auth backend. | `string` | n/a | yes |
| <a name="input_read_paths"></a> [read\_paths](#input\_read\_paths) | List of Vault paths for read access. Each path should include wildcards as needed (e.g., 'prod/kv/*'). | `list(string)` | `[]` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Name of the Vault JWT auth backend role. Must be unique within the JWT backend. | `string` | n/a | yes |
| <a name="input_vault_namespace_path"></a> [vault\_namespace\_path](#input\_vault\_namespace\_path) | Vault namespace for resources. | `string` | `null` | no |
| <a name="input_workflow"></a> [workflow](#input\_workflow) | GitHub Actions workflow name for bound\_claims.workflow. If null, any workflow will be authorized. | `string` | `null` | no |
| <a name="input_write_paths"></a> [write\_paths](#input\_write\_paths) | List of Vault paths for write access. Each path should include wildcards as needed (e.g., 'nonprod/kv/*'). | `list(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->