resource "azurerm_kubernetes_cluster" "k8s" {
    name                = var.cluster_name
    location            = var.resource_group_location
    resource_group_name = var.resource_group_name
    dns_prefix          = var.dns_prefix

    default_node_pool {
        name            = "agentpool"
        node_count      = var.agent_count
        vm_size         = "standard_ds2"
    }

    service_principal {
        client_id     = var.aks_service_principal_app_id
        client_secret = var.aks_service_principal_client_secret
    }

    addon_profile {
        oms_agent {
            enabled                    = false
        }
    }

    network_profile {
        load_balancer_sku = "Standard"
        network_plugin = "kubenet"
    }

    tags = {
        Environment = "Development"
    }
}