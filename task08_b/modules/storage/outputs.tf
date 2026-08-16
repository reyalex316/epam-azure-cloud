output "blob_url" {
  description = "Full URL of the application archive blob"
  value       = azurerm_storage_blob.app.url
}

output "sas_token" {
  description = "SAS token for the blob container"
  sensitive   = true
  value       = data.azurerm_storage_account_blob_container_sas.main.sas
}

output "storage_account_id" {
  description = "ID of the Storage Account"
  value       = azurerm_storage_account.main.id
}