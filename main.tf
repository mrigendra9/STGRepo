resource "azurerm_resource_group" "rg" {
name = "rg-Mrigendra"
location = "west europe"
}

resource "azurerm_resource_group" "test-rg" {
name = "test-rgepo"
location = "west europe"
}

resource "azurerm_resource_group" "test-rg23" {
name = "test-rgepo"
location = "west europe"
}


resource "azurerm_resource_group" "test-rg23" {
name = "test-rgepo"
location = "west europe"
}

resource "azurerm_storage_account" "storage" {
  name = "uatrepostorage01"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_account" "storage1" {
  name = "uatrepostorage02"
  resource_group_name = "rg-uatrepo"
  location = "west europe"
  account_tier = "Standard"
  account_replication_type = "LRS"
  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_virtual_network" "vnet" {
  name = "vnet-uatrepo"
  resource_group_name = "azurerm_resource_group.rg.name"
  location = "azurerm_resource_group.rg.name"
  address_space = ["192.168.10.0/24"]
  dns_servers = [ "192.168.10.5" ]

  subnet {
    name = "subnet-uatrepo"
    address_prefixes = "192.168.10.0/24"
   }
   subnet = { 
    name = "subnet=uatrepo01"
    address_prefixes = "192.168.11.0/24"
   }
  }
