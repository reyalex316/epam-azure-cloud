resource "azurerm_resource_group" "rg_name" {
  name     = var.rg_name
  location = var.location
  tags     = { Creator = "${var.tag}" }
}

resource "azurerm_virtual_network" "vnet_name" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg_name.name
  location            = azurerm_resource_group.rg_name.location
  address_space       = var.vnet_address_space
  tags                = { Creator = "${var.tag}" }
}

resource "azurerm_subnet" "subnet_name" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg_name.name
  virtual_network_name = azurerm_virtual_network.vnet_name.name
  address_prefixes     = var.subnet_address_prefix
}

resource "azurerm_public_ip" "public_ip_name" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.rg_name.location
  resource_group_name = azurerm_resource_group.rg_name.name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = var.dns_label
  tags                = { Creator = "${var.tag}" }
}

resource "azurerm_network_security_group" "nsg_name" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg_name.location
  resource_group_name = azurerm_resource_group.rg_name.name
  tags                = { Creator = "${var.tag}" }
}

resource "azurerm_network_security_rule" "nsg_rule01" {
  name                        = var.nsg_name_ssh
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg_name.name
  network_security_group_name = azurerm_network_security_group.nsg_name.name
}

resource "azurerm_network_security_rule" "nsg_rule02" {
  name                        = var.nsg_name_http
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg_name.name
  network_security_group_name = azurerm_network_security_group.nsg_name.name
}

resource "azurerm_network_interface" "nic_name" {
  name                = var.nic_name
  location            = azurerm_resource_group.rg_name.location
  resource_group_name = azurerm_resource_group.rg_name.name
  ip_configuration {
    name                          = var.nic_ip_config
    subnet_id                     = azurerm_subnet.subnet_name.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip_name.id
  }
  tags = { Creator = "${var.tag}" }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg_ass" {
  network_interface_id      = azurerm_network_interface.nic_name.id
  network_security_group_id = azurerm_network_security_group.nsg_name.id
}

resource "azurerm_linux_virtual_machine" "lin_vm" {
  name                  = var.vm_name
  location              = azurerm_resource_group.rg_name.location
  resource_group_name   = azurerm_resource_group.rg_name.name
  network_interface_ids = [azurerm_network_interface.nic_name.id]
  size                  = "B2als_v2"
  os_disk {
    name                 = var.os_disk_name
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
  computer_name                   = var.vm_name
  admin_username                  = var.vm_admin
  disable_password_authentication = false
  admin_password                  = var.vm_password
  tags                            = { Creator = "${var.tag}" }

  connection {
    type     = "ssh"
    host     = azurerm_public_ip.public_ip_name.ip_address
    user     = var.vm_admin
    password = var.vm_password
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nginx",
      "sudo service nginx restart"
    ]

  }

}

provider "azurerm" {
  features {}
}
 