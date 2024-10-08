# main.tf (Stage 1)

# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "westus"
}

# Create a virtual network
resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

# Create a subnet
resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Output the subnet ID
output "subnet_id" {
  value = azurerm_subnet.example.id
}

terraform {
  backend "azurerm" {
    resource_group_name   = "example-resources"
    storage_account_name  = "examplestorageacct1"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
