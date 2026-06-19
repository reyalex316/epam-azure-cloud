output "app_id" {
  description = "ID of the Windows Web App"
  value       = azurerm_windows_web_app.main.id
}

output "app_default_hostname" {
  description = "Default hostname of the Windows Web App"
  value       = azurerm_windows_web_app.main.default_hostname
}