# output.tf

# Public IP of the Linux VM
output "vm_public_ip" {
  description = "The public IP address of the Linux VM"
  value       = azurerm_public_ip.pip.ip_address
}

# Resource Group Name
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.rg.name
}

# VM Name
output "vm_name" {
  description = "The name of the Linux VM"
  value       = azurerm_linux_virtual_machine.vm.name
}

# Network Interface ID
output "nic_id" {
  description = "The Network Interface ID"
  value       = azurerm_network_interface.nic.id
}
# Admin username
output "vm_admin_username" {
  description = "The admin username of the VM"
  value       = var.vm_user
}

# SSH Command to access the VM
output "ssh_command" {
  description = "SSH command to connect to the Linux VM"
  value       = "ssh ${var.vm_user}@${azurerm_public_ip.pip.ip_address}"
}
