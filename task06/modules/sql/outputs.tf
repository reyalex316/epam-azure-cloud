output "sql_server_fqdn" {
  description = "Fully qualified domain name of the SQL Server"
  value       = azurerm_mssql_server.main.fully_qualified_domain_name
}

output "sql_connection_string" {
  description = "ADO.NET connection string for the SQL Database"
  sensitive   = true
  value       = "Server=tcp:${azurerm_mssql_server.main.fully_qualified_domain_name},1433;Database=${azurerm_mssql_database.main.name};User ID=${var.admin_username};Password=${random_password.sql_admin.result};Encrypt=true;Connection Timeout=30;"
}