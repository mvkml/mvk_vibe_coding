
resource "azurerm_resource_group" "terraform_state_rg" {
  name     = var.state_resource_group_name
  location = var.location

  tags = {
    Environment = "Bootstrap"
    Project     = "MasterControlProgram"
    ManagedBy   = "Terraform"
    CreatedBy   = "AzureDevOps"
    Purpose     = "TerraformStateStorage"
  }
}

resource "azurerm_storage_account" "terraform_state_sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.terraform_state_rg.name
  location                 = azurerm_resource_group.terraform_state_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  tags = {
    Environment = "Bootstrap"
    Project     = "MasterControlProgram"
    ManagedBy   = "Terraform"
    CreatedBy   = "AzureDevOps"
    Purpose     = "TerraformStateStorage"
  }
}

resource "azurerm_storage_container" "terraform_state_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.terraform_state_sa.name
  container_access_type = "private"
}