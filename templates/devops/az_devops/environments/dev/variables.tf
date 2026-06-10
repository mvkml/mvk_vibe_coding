variable "client_id" {
  description = "Azure Service Principal Client ID"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Azure Service Principal Client Secret"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "state_resource_group_name" {
  description = "Resource group name that holds the Terraform state storage account"
  type        = string
  default     = "rg-terraform-state"
}

variable "location" {
  description = "Azure region for all bootstrap resources"
  type        = string
  default     = "Central India"
}

variable "storage_account_name" {
  description = "Storage account name for Terraform remote state"
  type        = string
  default     = "mcptfstate2ea7f68f"
}

variable "container_name" {
  description = "Blob container name inside the storage account"
  type        = string
  default     = "tfstate"
}
