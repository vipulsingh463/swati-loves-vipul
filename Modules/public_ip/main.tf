resource "azurerm_publi_ip" "pip" {
    name = var.pip_name
    resource_group_name = var.resource_name
    location = var.location
    allocation_method = var.allocation_method
}