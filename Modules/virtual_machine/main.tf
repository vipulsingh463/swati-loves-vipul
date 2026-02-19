resource "azurerm_network_interface" "nic" {
    name = var.nic_name
    resource_group_name = var.resource_name
    location = var.location

    ip_configuration {
      name = "internal"
      subnet_id = azurerm_subnet_subnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = var.pip_name
    }
}

resource "azurerm_linux_virtual_machine" "vm" {
    name = var.vm_name
    resource_group_name = var.resource_name
    location = var.location
    size = var.size
    admin_username = var.admin_username
    admin_password = var.admin_password
    network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer = var.offer
    sku = var.sku
    version = var.image_version
  }
}