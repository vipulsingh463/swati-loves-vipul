module "resource_group" {
  source = "../Modules/resource group"
  resource_name = "todonew"
  location = "central india"
}

module "virtual_network" {
  source = "../Modules/virtual_network"
  depends_on = [ module.resource_group ]

  virtual_name = "todovnet"
  location = "central india"
  resource_name = "todonew"
  address_space = ["10.0.0.0/16"]
}

module "frontend_vm" {
  source = "../Modules/virtual_machine"
  depends_on = [ module.virtual_network ]

  nic_name = ""
  location = "central india"
  resource_name = "todonew"
  pip_name = ""
  vm_name = ""
  size = ""
  admin_username = ""
  admin_password = ""
  caching = ""
  storage_account_type = ""
  publisher = ""
  offer = ""
  sku = ""
  image_version = "latest"
}


module "backend_vm" {
  source = "../Modules/virtual_machine"
  depends_on = [ module.virtual_network ]

  nic_name = ""
  location = "central india"
  resource_name = "todonew"
  pip_name = ""
  vm_name = ""
  size = ""
  admin_username = ""
  admin_password = ""
  caching = ""
  storage_account_type = ""
  publisher = ""
  offer = ""
  sku = ""
  image_version = "latest"
}