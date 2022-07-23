variable "virtual_network_name" {
  type = string
  description = "VNet Name"
}

variable "virtual_subnet_name" {
  type = string
  description = "Subnet Name"
}
variable "virtual_machine_name1" {
  type = string
  description = "VM1 Name"
}

variable "virtual_machine_name2" {
  type = string
  description = "VM2 Name"
}
variable "virtual_machine_name3" {
  type = string
  description = "VM3 Name"
}
variable "virtual_machine_name4" {
  type = string
  description = "VM4 Name"
}

variable "master_vm_size" {
  type = string
  description = "Master VM Size"
}
variable "worker_vm_size" {
  type = string
  description = "Worker VM Size"
}
variable "nfs_vm_size" {
  type = string
  description = "NFS VM Size"
}

variable "name_nic1" {
  type = string
  description = "Nic 1 Name"
}
variable "name_nic2" {
  type = string
  description = "Nic 2 Name"
}
variable "name_nic3" {
  type = string
  description = "Nic 3 Name"
}
variable "name_nic4" {
  type = string
  description = "Nic 4 Name"
}