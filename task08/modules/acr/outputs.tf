output "acr_id" {
  description = "ID of the Azure Container Registry"
  value       = azurerm_container_registry.main.id
}

output "login_server" {
  description = "Login server URL of the ACR"
  value       = azurerm_container_registry.main.login_server
}

output "admin_username" {
  description = "Admin username of the ACR"
  value       = azurerm_container_registry.main.admin_username
}

output "admin_password" {
  description = "Admin password of the ACR"
  sensitive   = true
  value       = azurerm_container_registry.main.admin_password
}