output "kube_config" {
  description = "Kubernetes config for the AKS cluster"
  sensitive   = true
  value       = azurerm_kubernetes_cluster.main.kube_config[0]
}

output "kubelet_identity_object_id" {
  description = "Object ID of the AKS kubelet identity"
  value       = azurerm_kubernetes_cluster.main.kubelet_identity[0].object_id
}

output "kv_access_identity_id" {
  description = "Client ID of the Key Vault secrets provider identity"
  value       = azurerm_kubernetes_cluster.main.key_vault_secrets_provider[0].secret_identity[0].client_id
}

output "tenant_id" {
  description = "Tenant ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.main.identity[0].tenant_id
}