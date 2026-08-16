output "fqdn" {
  description = "FQDN of the Azure Container App"
  value       = azurerm_container_app.main.latest_revision_fqdn
}