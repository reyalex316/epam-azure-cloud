output "rg_id" {
  description = "ID of the Resource Group"
  value       = azurerm_resource_group.rg_name.id
}

output "sa_blob_endpoint" {
  description = "Primary blob endpoint of the Storage"
  value       = azurerm_storage_account.storage_name.primary_blob_endpoint
}

output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet_name.id
}