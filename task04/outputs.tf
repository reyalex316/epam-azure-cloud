output "vm_public_ip" {
  description = "The Virtual Machine public IP"
  value       = azurerm_public_ip.public_ip_name.ip_address
}

output "vm_fqdn" {
  description = "Fully Qualified Domain Name of the Virtual Machine"
  value       = azurerm_public_ip.public_ip_name.fqdn
}
