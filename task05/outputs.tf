output "traffic_manager_fqdn" {
  description = "FQDN of the Azure Traffic Manager profile"
  value       = module.traffic_manager.tm_fqdn
}