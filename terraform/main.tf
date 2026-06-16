provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
}

# ---------------- RESOURCE GROUP ----------------
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# ---------------- NETWORK MODULE ----------------
module "network" {
  source              = "./modules/virtual_network"
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

# ---------------- ACR MODULE ----------------
module "acr" {
  source              = "./modules/container_registry"
  acr_name            = var.acr_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

# ---------------- AKS MODULE ----------------
module "aks" {
  source              = "./modules/aks"
  aks_name            = var.aks_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = module.network.subnet_id
}
