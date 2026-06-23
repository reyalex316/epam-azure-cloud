output "fqdn" {
  description = "FQDN of the Azure Container Instance"
  value       = azurerm_container_group.main.fqdn
}

output "ip_address" {
  description = "IP address of the Azure Container Instance"
  value       = azurerm_container_group.main.ip_address
}