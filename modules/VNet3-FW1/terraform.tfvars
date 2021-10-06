########################################## RG0 ##########################################

######################### RG #########################
RG0_name = "RG0-EastUS-Prod-Hub"
RG0_location = "East US"

######################### VNet #########################
VNet0_name = "VNet0-EastUS-Prod-Hub"
VNet0_address = "10.0.0.0/16"
VNet0_JumpBoxSubnet_name = "JumpBoxSubnet"
VNet0_JumpBoxSubnet_address = "10.0.0.0/24"
VNet0_AzureFirewallSubnet_name = "AzureFirewallSubnet"
VNet0_AzureFirewallSubnet_address = "10.0.1.0/24"

######################### VM #########################
RG0_VM1nic_name = "RG0_VM1nic"
RG0_VM1_name = "RG0-VM1"


########################################## RG1 ##########################################

######################### RG #########################
RG1_name = "RG1-WestUS-Prod-Hub"
RG1_location = "West US"

######################### VNet #########################
VNet1_name = "VNet1-WestUS-Prod-Hub"
VNet1_address = "10.1.0.0/16"
VNet1_Subnet1_name = "Subnet1"
VNet1_Subnet1_address = "10.1.0.0/24"


########################################## RG2 ##########################################

######################### RG #########################
RG2_name = "RG2-EastAsia-Prod-Hub"
RG2_location = "East Asia"

######################### VNet #########################
VNet2_name = "VNet2-EastAsia-Prod-Hub"
VNet2_address = "10.2.0.0/16"
VNet2_Subnet1_name = "Subnet1"
VNet2_Subnet1_address = "10.2.0.0/24"