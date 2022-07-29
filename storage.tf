variable "storage_account_name" {
    type=string
    default="az400terraform2907"
}
 
variable "resource_group_name" {
    type=string
    default="az400-rg2"
}
 
provider "azurerm"{
version = "=2.0"
subscription_id = "73e6a843-d02a-4eaa-93b4-35f8b1e66822"
tenant_id       = "5904b7de-085c-4532-8889-4295e1a79e11"
features {}
}
 
resource "azurerm_resource_group" "grp" {
  name     = var.resource_group_name
  location = "East US"
}
 
resource "azurerm_storage_account" "store" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.grp.name
  location                 = azurerm_resource_group.grp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
