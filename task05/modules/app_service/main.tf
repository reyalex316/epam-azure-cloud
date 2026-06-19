resource "azurerm_windows_web_app" "main" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  tags                = var.tags

  site_config {
    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        name        = ip_restriction.value.name
        action      = ip_restriction.value.action
        priority    = ip_restriction.value.priority
        ip_address  = lookup(ip_restriction.value, "ip_address", null)
        service_tag = lookup(ip_restriction.value, "service_tag", null)
      }
    }
    ip_restriction_default_action = "Deny"
  }
}