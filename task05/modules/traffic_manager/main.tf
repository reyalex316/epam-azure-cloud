resource "azurerm_traffic_manager_profile" "main" {
  name                   = var.tm_name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.routing_method
  tags                    = var.tags

  dns_config {
    relative_name = var.tm_name
    ttl           = 30
  }

  monitor_config {
    protocol = "HTTP"
    port     = 80
    path     = "/"
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "main" {
  for_each           = var.endpoints
  name               = each.key
  profile_id         = azurerm_traffic_manager_profile.main.id
  target_resource_id = each.value
  weight             = 100
}