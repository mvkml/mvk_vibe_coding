terraform {
#   required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

#   backend "azurerm" {
#     resource_group_name  = "rg-tfstate"
#     storage_account_name = "mcptfstate2ea7f68f"
#     container_name       = "tfstate"
#     key                  = "dev.terraform.tfstate"
#   }

  # Agent-level state archive — state persists on VIDHYA at fixed path.
  # All pipelines (build/apply/destroy) read from this path automatically.
  # Archive convention: C:\terraform-state\<TF_STATE_KEY>\terraform.tfstate
  backend "local" {
    path = "C:/terraform-state/mcpdevops/terraform.tfstate"
  }

}



provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}
