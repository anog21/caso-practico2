# Creamos una máquina virtual
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine

resource "azurerm_linux_virtual_machine" "mastervm" {
    name                = var.virtual_machine_name1
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.master_vm_size
    admin_username      = var.ssh_user
    network_interface_ids = [ azurerm_network_interface.nic1.id ]
    disable_password_authentication = true
    computer_name = "master.azure"
    
    admin_ssh_key {
    username   = var.ssh_user
    public_key = file(var.public_key_path)
  }

    # Disk type
    
    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
    
    # Se escoger la imagen para la máquina virtual del Master

    source_image_reference {
        publisher = "cognosys"
        offer = "centos-8-stream-free"
        sku = "centos-8-stream-free"
        version = "22.03.28"  
    }
    plan {
        name = "centos-8-stream-free"
        product = "centos-8-stream-free"
        publisher = "cognosys"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }

    tags = {
        environment = "CasoPractico2"
    }
}
resource "azurerm_linux_virtual_machine" "workervm" {
    name                = var.virtual_machine_name2
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.worker_vm_size
    admin_username      = var.ssh_user
    network_interface_ids = [ azurerm_network_interface.nic2.id ]
    disable_password_authentication = true
    computer_name = "worker1.azure"
    
    admin_ssh_key {
    username   = var.ssh_user
    public_key = file(var.public_key_path)
  }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "cognosys"
        offer = "centos-8-stream-free"
        sku = "centos-8-stream-free"
        version = "22.03.28"  
    }
    plan {
        name = "centos-8-stream-free"
        product = "centos-8-stream-free"
        publisher = "cognosys"
    }
    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }
    tags = {
        environment = "CasoPractico2"
    }
}

resource "azurerm_linux_virtual_machine" "workervm2" {
    name                = var.virtual_machine_name4
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.worker_vm_size
    admin_username      = var.ssh_user
    network_interface_ids = [ azurerm_network_interface.nic4.id ]
    disable_password_authentication = true
    computer_name = "worker2.azure"
    
    admin_ssh_key {
    username   = var.ssh_user
    public_key = file(var.public_key_path)
  }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "cognosys"
        offer = "centos-8-stream-free"
        sku = "centos-8-stream-free"
        version = "22.03.28"  
    }
    plan {
        name = "centos-8-stream-free"
        product = "centos-8-stream-free"
        publisher = "cognosys"
    }
    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }
    tags = {
        environment = "CasoPractico2"
    }
}

resource "azurerm_linux_virtual_machine" "nfs" {
    name                = var.virtual_machine_name3
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.nfs_vm_size
    admin_username      = var.ssh_user
    network_interface_ids = [ azurerm_network_interface.nic3.id ]
    disable_password_authentication = true
    computer_name = "nfs.azure"
    
    admin_ssh_key {
    username   = var.ssh_user
    public_key = file(var.public_key_path)
  }
    # Tipo de disco
    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "cognosys"
        offer = "centos-8-stream-free"
        sku = "centos-8-stream-free"
        version = "22.03.28"  
    }
    plan {
        name = "centos-8-stream-free"
        product = "centos-8-stream-free"
        publisher = "cognosys"
    }
    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }
    tags = {
        environment = "CasoPractico2"
    }
}


