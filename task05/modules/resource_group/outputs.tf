output "rg_name" {
  value       = azurerm_resource_group.main.name
  description = "The Name of the Resource Group"
}

output "rg_location" {
  value       = azurerm_resource_group.main.location
  description = "The Location of the Resource Group"
}

output "rg_id" {
  value       = azurerm_resource_group.main.id
  description = "The ID of the Resource Group"
}