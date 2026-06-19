output "tm_fqdn" {
  description = "FQDN of the Traffic Manager profile"
  value       = azurerm_traffic_manager_profile.main.fqdn
}