output "fqdn" {
  description = "FQDN of the Redis ACI container group"
  value       = azurerm_container_group.redis.fqdn
}

output "ip_address" {
  description = "IP address of the Redis ACI"
  value       = azurerm_container_group.redis.ip_address
}

output "redis_password" {
  description = "Redis password"
  sensitive   = true
  value       = random_password.redis.result
}

output "redis_hostname" {
  description = "Redis hostname"
  value       = azurerm_container_group.redis.fqdn
}