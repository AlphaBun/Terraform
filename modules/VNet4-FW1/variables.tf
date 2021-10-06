########################################## RG0 ##########################################

######################### RG #########################
variable "RG0_name" {
  #default = "VNet0-EastUS-Prod-Hub"
}
variable "RG0_location" {
  #default = "East US"
}

######################### VNet #########################
variable "VNet0_name" {
  #default = "VNet0-EastUS-Prod-Hub"
}
variable "VNet0_address" {
  #default = "10.0.0.0/16"
}
variable "VNet0_JumpBoxSubnet_name" {
  #default = "JumpBoxSubnet"
}
variable "VNet0_JumpBoxSubnet_address" {
  #default = "10.0.0.0/24"
}
variable "VNet0_AzureFirewallSubnet_name" {
  #default = "AzureFirewallSubnet"
}
variable "VNet0_AzureFirewallSubnet_address" {
  #default = "10.0.1.0/24"
}

######################### VM #########################
variable "RG0_VM1nic_name" {
  #default = "RG0_VM1nic"
}
variable "RG0_VM1_name" {
  #default = "RG0-VM1"
}

########################################## RG1 ##########################################

######################### RG #########################
variable "RG1_name" {
  #default = "RG1-WestUS-Prod-Hub"
}
variable "RG1_location" {
  #default = "West US"
}

######################### VNet #########################
variable "VNet1_name" {
  #default = "VNet1-WestUS-Prod-Hub"
}
variable "VNet1_address" {
  #default = "10.1.0.0/16"
}
variable "VNet1_Subnet1_name" {
  #default = "Subnet1"
}
variable "VNet1_Subnet1_address" {
  #default = "10.1.0.0/24"
}

########################################## RG2 ##########################################

######################### RG #########################
variable "RG2_name" {
  #default = "RG2-EastAsia-Prod-Hub"
}
variable "RG2_location" {
  #default = "East Asia"
}

######################### VNet #########################
variable "VNet2_name" {
  #default = "VNet2-EastAsia-Prod-Hub"
}
variable "VNet2_address" {
  #default = "10.2.0.0/16"
}
variable "VNet2_Subnet1_name" {
  #default = "Subnet1"
}
variable "VNet2_Subnet1_address" {
  #default = "10.2.0.0/24"
}