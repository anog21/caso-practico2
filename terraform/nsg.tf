# Este es el archivo donde se declaran todos los Network Security Groups (NSGs)
resource "azurerm_network_security_group" "nsgmaster" {
    name                = "nsgmaster"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "HTTP"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "HTTP8080"
        priority                   = 1003
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8080"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    tags = {
        environment = "CasoPractico2"
    }
}
resource "azurerm_network_security_group" "nsgworker" {
    name                = "nsgworker"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}
resource "azurerm_network_security_group" "nsgnfs" {
    name                = "nsgnfs"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}

# Se asocian los security groups a las diferentes interfaces de red

resource "azurerm_network_interface_security_group_association" "nsg1tonic1" {
    network_interface_id      = azurerm_network_interface.nic1.id
    network_security_group_id = azurerm_network_security_group.nsgmaster.id
}
resource "azurerm_network_interface_security_group_association" "nsg2tonic2" {
    network_interface_id      = azurerm_network_interface.nic2.id
    network_security_group_id = azurerm_network_security_group.nsgworker.id

}
resource "azurerm_network_interface_security_group_association" "nsg3tonic3" {
    network_interface_id      = azurerm_network_interface.nic3.id
    network_security_group_id = azurerm_network_security_group.nsgnfs.id

}
resource "azurerm_network_interface_security_group_association" "nsg4tonic4" {
    network_interface_id      = azurerm_network_interface.nic4.id
    network_security_group_id = azurerm_network_security_group.nsgworker.id

}