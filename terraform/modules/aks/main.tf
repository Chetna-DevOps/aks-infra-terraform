resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aksdns"

  default_node_pool {
    name           = "chetnapool"
    node_count     = 2
    vm_size        = "Standard_D2s_v3"
    vnet_subnet_id = var.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
  network_plugin = "azure"
  service_cidr   = "172.16.0.0/16"
  dns_service_ip = "172.16.0.10"
}
}