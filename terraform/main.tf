# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
#Especificamos el provider, en este caso, Azure
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.1"
    }
  }
}
# Especificamos el resource group con su nombre y su entorno
resource "azurerm_resource_group" "rg" {
    name     =  "kubernetes"
    location = var.location
    tags = {
        environment = "CasoPractico2"
    }
}
# 
resource "azurerm_storage_account" "stAccount" {
    name                     = var.storage_account
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "CasoPractico2"
    }

}