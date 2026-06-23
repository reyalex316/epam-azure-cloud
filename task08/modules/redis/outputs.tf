output "hostname" {
  description = "Hostname of the Redis Cache instance"
  value       = azurerm_redis_cache.main.hostname
}

output "primary_access_key" {
  description = "Primary access key of the Redis Cache instance"
  sensitive   = true
  value       = azurerm_redis_cache.main.primary_access_key
}

output "ssl_port" {
  description = "SSL port of the Redis Cache instance"
  value       = azurerm_redis_cache.main.ssl_port
}