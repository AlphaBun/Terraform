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


########################################## RG0 ##########################################

######################### RG #########################
resource "azurerm_resource_group" "RG0" {
  name     = var.RG0_name
  location = var.RG0_location
}

######################### VNet #########################
resource "azurerm_virtual_network" "VNet0" {
    name                = var.VNet0_name
    address_space       = [var.VNet0_address]
    location            = azurerm_resource_group.RG0.location
    resource_group_name = azurerm_resource_group.RG0.name
}

resource "azurerm_subnet" "VNet0_JumpBoxSubnet" {
  name                 = var.VNet0_JumpBoxSubnet_name
  resource_group_name  = azurerm_resource_group.RG0.name
  virtual_network_name = azurerm_virtual_network.VNet0.name
  address_prefixes     = [var.VNet0_JumpBoxSubnet_address]
}

resource "azurerm_subnet" "VNet0_AzureFirewallSubnet" {
  name                 = var.VNet0_AzureFirewallSubnet_name
  resource_group_name  = azurerm_resource_group.RG0.name
  virtual_network_name = azurerm_virtual_network.VNet0.name
  address_prefixes     = [var.VNet0_AzureFirewallSubnet_address]
}

######################### VM #########################
resource "azurerm_network_interface" "RG0_VM1nic" {
  name                = var.RG0_VM1nic_name
  location            = azurerm_virtual_network.VNet0.location
  resource_group_name = azurerm_resource_group.RG0.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.VNet0_JumpBoxSubnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "RG0_VM1" {
  name                = var.RG0_VM1_name
  resource_group_name = azurerm_resource_group.RG0.name
  location            = azurerm_resource_group.RG0.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "Hello123456!"
  network_interface_ids = [azurerm_network_interface.RG0_VM1nic.id]

  disable_password_authentication = false # set to true if using SSH Keys

  # This one is only applicable for azurerm_virtual_machine. Uncomment this line to delete the OS disk automatically when deleting the VM
  #delete_os_disk_on_termination = true

  # This one is only applicable for azurerm_virtual_machine. Uncomment this line to delete the data disks automatically when deleting the VM
  #delete_data_disks_on_termination = true

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}


########################################## RG1 ##########################################

######################### RG #########################
resource "azurerm_resource_group" "RG1" {
  name     = var.RG1_name
  location = var.RG1_location
}

######################### VNet #########################
resource "azurerm_virtual_network" "VNet1" {
    name                = var.VNet1_name
    address_space       = [var.VNet1_address]
    location            = azurerm_resource_group.RG1.location
    resource_group_name = azurerm_resource_group.RG1.name
}

resource "azurerm_subnet" "VNet1_Subnet1" {
  name                 = var.VNet1_Subnet1_name
  resource_group_name  = azurerm_resource_group.RG1.name
  virtual_network_name = azurerm_virtual_network.VNet1.name
  address_prefixes     = [var.VNet1_Subnet1_address]
}




########################################## RG2 ##########################################

######################### RG #########################
resource "azurerm_resource_group" "RG2" {
  name     = var.RG2_name
  location = var.RG2_location
}

######################### VNet #########################
resource "azurerm_virtual_network" "VNet2" {
    name                = var.VNet2_name
    address_space       = [var.VNet2_address]
    location            = azurerm_resource_group.RG2.location
    resource_group_name = azurerm_resource_group.RG2.name
}

resource "azurerm_subnet" "VNet2_Subnet1" {
  name                 = var.VNet2_Subnet1_name
  resource_group_name  = azurerm_resource_group.RG2.name
  virtual_network_name = azurerm_virtual_network.VNet2.name
  address_prefixes     = [var.VNet2_Subnet1_address]
}


#module "storage_account" {
#  source    = "./modules/storage-account"
#
#  saname    = "statfdemosa234"
#  rgname    = azurerm_resource_group.rg.name
#  location  = azurerm_resource_group.rg.location
#}