# 1. Resource Group
resource "azurerm_resource_group" "rg" {
    name = var.rg_name
    location = var.location
}
# 2.Virtual network
resource "azurerm_virtual_network"  "vnet" {
  name = var.vnet_name
  address_space = var.vnet_address_space
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
# 3. Subnet
resource "azurerm_subnet" "subnet" {
  name = var.subnet_name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.subnet_prefixes
}

# 4. Public IP
resource "azurerm_public_ip" "pip" {
  name = var.public_ip_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Static"

}

# 5. Network Security Group 
resource "azurerm_network_security_group" "nsg" {
    name = var.nsg_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  

        security_rule {
            name                          = "SSH"
            priority                      = 1001
            direction                     = "Inbound"
            access                        = "Allow"
            protocol                      = "Tcp"
            source_port_range             = "*"
            destination_port_range        = "22"                 
            source_address_prefix         = "*"
            destination_address_prefix    = "*"
        }
}

# 6. Network Interface
resource "azurerm_network_interface" "nic" {
    name = var.nic_name
    location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

        ip_configuration {
            name                          = "internal"
            subnet_id                     = azurerm_subnet.subnet.id
            private_ip_address_allocation = "Dynamic"
            public_ip_address_id          = azurerm_public_ip.pip.id
        }
}

# 7. Attach NSG to NIC (new block)
resource "azurerm_network_interface_security_group_association" "nic_nsg_assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
# 8. Linux Virtual Machine

resource "azurerm_linux_virtual_machine" "vm" {
    name                     = var.vm_name
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    size                     = var.vm_size
    admin_username           = var.vm_user
    admin_password           = var.vm_password
    network_interface_ids    = [azurerm_network_interface.nic.id]
  
            source_image_reference {
                publisher = "Canonical"
                offer     = "UbuntuServer"
                sku       = "20_04-lts"
                version   = "latest"
        }
            os_disk {
                name                      = "${var.vm_name}-osdisk"
                caching                   = "ReadWrite"
                storage_account_type      = "Standard_LRS"
    
  }


 }