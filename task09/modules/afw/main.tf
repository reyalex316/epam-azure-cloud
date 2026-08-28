resource "azurerm_subnet" "firewall" {
  name                 = local.fw_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.fw_subnet_address_prefix]
}

resource "azurerm_public_ip" "firewall" {
  name                = var.fw_pip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_firewall" "main" {
  name                = local.fw_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.fw_sku_name
  sku_tier            = var.fw_sku_tier
  tags                = var.tags

  ip_configuration {
    name                 = local.fw_ip_config_name
    subnet_id            = azurerm_subnet.firewall.id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }
}

resource "azurerm_route_table" "main" {
  name                          = local.rt_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  bgp_route_propagation_enabled = false
  tags                          = var.tags

  route {
    name                   = local.route_name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.main.ip_configuration[0].private_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "aks" {
  subnet_id      = var.aks_subnet_id
  route_table_id = azurerm_route_table.main.id
}

resource "azurerm_firewall_nat_rule_collection" "main" {
  name                = local.nat_collection_name
  azure_firewall_name = azurerm_firewall.main.name
  resource_group_name = var.resource_group_name
  priority            = 100
  action              = "Dnat"

  dynamic "rule" {
    for_each = local.nat_rules
    content {
      name                  = rule.value.name
      protocols             = rule.value.protocols
      source_addresses      = rule.value.source_addresses
      destination_addresses = [azurerm_public_ip.firewall.ip_address]
      destination_ports     = rule.value.destination_ports
      translated_address    = rule.value.translated_address
      translated_port       = rule.value.translated_port
    }
  }
}

resource "azurerm_firewall_network_rule_collection" "main" {
  name                = local.net_collection_name
  azure_firewall_name = azurerm_firewall.main.name
  resource_group_name = var.resource_group_name
  priority            = 200
  action              = "Allow"

  dynamic "rule" {
    for_each = local.network_rules
    content {
      name                  = rule.value.name
      protocols             = rule.value.protocols
      source_addresses      = rule.value.source_addresses
      destination_addresses = rule.value.destination_addresses
      destination_ports     = rule.value.destination_ports
    }
  }
}

resource "azurerm_firewall_application_rule_collection" "main" {
  name                = local.app_collection_name
  azure_firewall_name = azurerm_firewall.main.name
  resource_group_name = var.resource_group_name
  priority            = 300
  action              = "Allow"

  dynamic "rule" {
    for_each = local.app_rules
    content {
      name             = rule.value.name
      source_addresses = rule.value.source_addresses
      target_fqdns     = rule.value.target_fqdns

      dynamic "protocol" {
        for_each = rule.value.protocols
        content {
          port = protocol.value.port
          type = protocol.value.type
        }
      }
    }
  }
}

data "azurerm_kubernetes_cluster" "main" {
  name                = var.aks_cluster_name
  resource_group_name = var.resource_group_name
}

data "azurerm_resources" "aks_nsg" {
  resource_group_name = data.azurerm_kubernetes_cluster.main.node_resource_group
  type                = "Microsoft.Network/networkSecurityGroups"
}

resource "azurerm_network_security_rule" "allow_firewall_to_lb" {
  name                        = "AllowAccessFromFirewallPublicIPToLoadBalancerIP"
  priority                    = 400
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = azurerm_public_ip.firewall.ip_address
  destination_address_prefix  = var.aks_loadbalancer_ip
  resource_group_name         = data.azurerm_kubernetes_cluster.main.node_resource_group
  network_security_group_name = data.azurerm_resources.aks_nsg.resources[0].name
}