resource "azurerm_resource_group" "app_rg" {
  name     = "path0053-a12-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "app_vnet" {
  name                = "path0053-a12-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  tags = {
    environment = "test"
  }
}

resource "azurerm_subnet" "app_subnet" {
  name                 = "path0053-a12-subnet"
  resource_group_name  = azurerm_resource_group.app_rg.name
  virtual_network_name = azurerm_virtual_network.app_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}