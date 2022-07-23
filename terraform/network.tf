
resource "azurerm_virtual_network" "network" {
    name                = var.virtual_network_name
    address_space       = ["10.0.0.0/24"]
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    tags = {
        environment = "CasoPractico2"
    }
}

resource "azurerm_subnet" "subnet" {
    name                   = var.virtual_subnet_name
    resource_group_name    = azurerm_resource_group.rg.name
    virtual_network_name   = azurerm_virtual_network.network.name
    address_prefixes       = ["10.0.0.0/24"]
}
resource "azurerm_public_ip" "publicIP1" {
    name                = "vmip1"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method   = "Dynamic"
    sku                 = "Basic"

    tags = {
        environment = "CasoPractico2"
    }

}
resource "azurerm_public_ip" "publicIP2" {
    name                = "vmip2"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method   = "Dynamic"
    sku                 = "Basic"

    tags = {
        environment = "CasoPractico2"
    }

}
resource "azurerm_public_ip" "publicIP3" {
    name                = "vmip3"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method   = "Dynamic"
    sku                 = "Basic"

    tags = {
        environment = "CasoPractico2"
    }

}
resource "azurerm_public_ip" "publicIP4" {
    name                = "vmip4"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method   = "Dynamic"
    sku                 = "Basic"

    tags = {
        environment = "CasoPractico2"
    }

}

resource "azurerm_network_interface" "nic1" {
    name                = var.name_nic1  
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "config1"
    subnet_id                      = azurerm_subnet.subnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.0.10"
    public_ip_address_id           = azurerm_public_ip.publicIP1.id
    }
    tags = {
        environment = "CasoPractico2"
    }

}
resource "azurerm_network_interface" "nic2" {
    name                = var.name_nic2 
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "config2"
    subnet_id                      = azurerm_subnet.subnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.0.11"
    public_ip_address_id           = azurerm_public_ip.publicIP2.id
    }
    tags = {
        environment = "CasoPractico2"
    }

}
resource "azurerm_network_interface" "nic3" {
    name                = var.name_nic3 
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "config3"
    subnet_id                      = azurerm_subnet.subnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.0.12"
    public_ip_address_id           = azurerm_public_ip.publicIP3.id
    }
    tags = {
        environment = "CasoPractico2"
    }

}
resource "azurerm_network_interface" "nic4" {
    name                = var.name_nic4
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "config4"
    subnet_id                      = azurerm_subnet.subnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.0.13"
    public_ip_address_id           = azurerm_public_ip.publicIP4.id
    }
    tags = {
        environment = "CasoPractico2"
    }

}