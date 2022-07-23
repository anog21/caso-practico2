output "public_ip_address_master" {
  value = azurerm_linux_virtual_machine.mastervm.public_ip_address
}
output "public_ip_address_worker" {
  value = azurerm_linux_virtual_machine.workervm.public_ip_address
}
output "public_ip_address_worker2" {
  value = azurerm_linux_virtual_machine.workervm2.public_ip_address
}
output "public_ip_address_nfs" {
  value = azurerm_linux_virtual_machine.nfs.public_ip_address
}