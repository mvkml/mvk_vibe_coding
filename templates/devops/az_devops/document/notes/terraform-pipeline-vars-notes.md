# Terraform Pipeline Variables — Notes

**Date:** 2026-06-09

---

## Topic: `-var` flags in Azure DevOps Terraform Plan task

### Pipeline Task (TerraformTaskV4)

```yaml
- task: TerraformTaskV4@4
  displayName: 'Terraform Plan'
  inputs:
    provider: 'azurerm'
    command: 'plan'
    workingDirectory: '$(TF_WORKING_DIR)'
    commandOptions: >
      -out=$(TF_WORKING_DIR)/tfplan
      -var="client_id=$(ARM_CLIENT_ID)"
      -var="client_secret=$(ARM_CLIENT_SECRET)"
      -var="tenant_id=$(ARM_TENANT_ID)"
      -var="subscription_id=$(ARM_SUBSCRIPTION_ID)"
    environmentServiceNameAzureRM: 'azure-sc-terraform'
```

---

## How `-var` flags work

The `-var` flags inject Azure DevOps pipeline secret variables into Terraform at runtime.

| Pipeline Variable   | Terraform Variable  |
|---------------------|---------------------|
| `ARM_CLIENT_ID`     | `client_id`         |
| `ARM_CLIENT_SECRET` | `client_secret`     |
| `ARM_TENANT_ID`     | `tenant_id`         |
| `ARM_SUBSCRIPTION_ID` | `subscription_id` |

---

## Terraform Code Required

### variables.tf

```hcl
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "subscription_id" {}
```

### provider.tf

```hcl
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "mcptfstate2ea7f68f"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}
```

---

## Alternative: Environment Variables (no variables.tf needed)

Set these as pipeline environment variables instead of `-var` flags:

```
ARM_CLIENT_ID
ARM_CLIENT_SECRET
ARM_TENANT_ID
ARM_SUBSCRIPTION_ID
```

The `azurerm` provider reads them automatically — no `variable` blocks required. This is the cleaner approach for CI/CD pipelines.

---

## Key Concepts

- `-out=tfplan` saves the plan so a later `terraform apply` uses the exact same plan
- `environmentServiceNameAzureRM` is the Azure Service Connection name in DevOps — handles authentication to Azure
- Pipeline variables marked as **secret** are masked in logs but still passed to Terraform via `-var`
