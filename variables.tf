# Resource Gr
variable "rg_name" {
    description = "name of the resource group"
    type = string
    default = "fullstack-rg"
}
# Location info
variable "location" {
    description = "Azure location"
    type = string
    default = "eastus"
}
# Virtual Network
variable "vnet_name" {
    description = "Virtual network name"
    type = string
    default = "fullstack_vnet"
}
variable "vnet_address_space" {
    description = "Address space for vnet"
    type = list(string)
    default = [ "10.0.0.0/16" ]
}
# Subnet
variable "subnet_name" {
    description = "Subnet name"
    type = string
    default = "fullstack_subnet"
}
variable "subnet_prefixes" {
    description = "Subnet CIDR block"
    type = list(string)
    default = [ "10.0.1.0/24" ]
}
# Public IP
variable "public_ip_name" {
    description = "Public IP name"
    type = string
    default = "fullstack-pip"
}
# Network address traslator NIC
variable "nic_name" {
    description = "Network interface name"
    type = string
    default = "fullstack-nic"
}
# Network security group NSG
variable "nsg_name" {
    description = "Network security group name"
    type = string
    default = "fullstack-nsg"
}
# Linux Virtual machine
variable "vm_name" {
    description = "Linux virtual machine name"
    type = string
    default = "fullstack-vm" 
}
variable "vm_size" {
    description = "Linux virtual machine size"
    type = string
    default = "Standard_B1s"
}
variable "vm_user" {
    description = "VM admin username"
    type = string
    default = "azureuser" 
}
variable "vm_password" {
    description = "VM admin password"
    type = string
    default     = "StrongP@ssword123"

  
}