# terraform-vault-gha-access

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.8 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 4.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 5.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_jwt_auth_backend_role.int_gha_role](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend_role) | resource |
| [vault_policy.int_gha_policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy_document.int_gha_policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | GitHub organization for GHA OIDC bound\_audiences and subject claim. | `string` | n/a | yes |
| <a name="input_github_repositories"></a> [github\_repositories](#input\_github\_repositories) | List of GitHub repositories for the bound\_claims subject. Globs are allowed. | `list(string)` | n/a | yes |
| <a name="input_jwt_backend_path"></a> [jwt\_backend\_path](#input\_jwt\_backend\_path) | Path to the Vault JWT auth backend. | `string` | n/a | yes |
| <a name="input_vault_namespace_path"></a> [vault\_namespace\_path](#input\_vault\_namespace\_path) | Vault namespace for resources. | `string` | `null` | no |
| <a name="input_workflow"></a> [workflow](#input\_workflow) | GitHub Actions workflow name for bound\_claims.workflow. If null, any workflow will be authorized. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->