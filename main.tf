terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RG0" {
  name     = var.rg_name
  location = "EastUS"
}

resource "azurerm_virtual_network" "vnet" {
    name                = "VNet0"
    address_space       = ["10.0.0.0/16"]
    location            = "EastUS"
    resource_group_name = azurerm_resource_group.RG0.name
}