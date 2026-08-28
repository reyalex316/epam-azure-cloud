locals {
  fw_name             = format("%s-%s", var.name_prefix, "afw")
  fw_subnet_name      = "AzureFirewallSubnet"
  fw_ip_config_name   = format("%s-%s", var.name_prefix, "afw-ipconfig")
  rt_name             = format("%s-%s", var.name_prefix, "rt")
  route_name          = format("%s-%s", var.name_prefix, "route")
  nat_collection_name = format("%s-%s", var.name_prefix, "nat-collection")
  net_collection_name = format("%s-%s", var.name_prefix, "net-collection")
  app_collection_name = format("%s-%s", var.name_prefix, "app-collection")
  nsg_rule_name       = format("%s-%s", var.name_prefix, "allow-fw-to-lb")

  nat_rules = [
    {
      name               = "allow-http-inbound"
      protocols          = ["TCP"]
      source_addresses   = ["*"]
      destination_ports  = ["80"]
      translated_address = data.azurerm_lb.aks.private_ip_address
      translated_port    = "80"
    }
  ]

  network_rules = [
    { name = "allow-dns", protocols = ["UDP", "TCP"], source_addresses = ["10.0.0.0/24"], destination_addresses = ["*"], destination_ports = ["53"] },
    { name = "allow-ntp", protocols = ["UDP"], source_addresses = ["10.0.0.0/24"], destination_addresses = ["*"], destination_ports = ["123"] },
    { name = "allow-https-outbound", protocols = ["TCP"], source_addresses = ["10.0.0.0/24"], destination_addresses = ["*"], destination_ports = ["443"] },
    { name = "allow-http-outbound", protocols = ["TCP"], source_addresses = ["10.0.0.0/24"], destination_addresses = ["*"], destination_ports = ["80"] }
  ]

  app_rules = [
    {
      name             = "allow-aks-fqdns"
      source_addresses = ["10.0.0.0/24"]
      target_fqdns = [
        "*.hcp.eastus.azmk8s.io",
        "mcr.microsoft.com",
        "*.data.mcr.microsoft.com",
        "management.azure.com",
        "login.microsoftonline.com",
        "packages.microsoft.com",
        "acs-mirror.azureedge.net",
        "*.blob.core.windows.net",
        "*.cdn.mscr.io",
        "*.docker.io",
        "production.cloudflare.docker.com",
        "auth.docker.io",
        "registry-1.docker.io",
        "*.ubuntu.com",
        "security.ubuntu.com",
        "azure.archive.ubuntu.com"
      ]
      protocols = [
        { port = "80", type = "Http" },
        { port = "443", type = "Https" }
      ]
    }
  ]
}