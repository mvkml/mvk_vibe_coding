output "state_resource_group_name" {
  description = "Name of the resource group holding Terraform state"
  value       = azurerm_resource_group.terraform_state_rg.name
}

output "state_resource_group_id" {
  description = "Azure resource ID of the state resource group"
  value       = azurerm_resource_group.terraform_state_rg.id
}

output "storage_account_name" {
  description = "Name of the storage account holding Terraform state"
  value       = azurerm_storage_account.terraform_state_sa.name
}

output "storage_account_id" {
  description = "Azure resource ID of the storage account"
  value       = azurerm_storage_account.terraform_state_sa.id
}

output "container_name" {
  description = "Blob container name where terraform.tfstate is stored"
  value       = azurerm_storage_container.terraform_state_container.name
}
