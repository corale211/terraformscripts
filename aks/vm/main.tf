provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.10.0"
    }
  }
    backend "azurerm" {
        resource_group_name  = "iac-terraform"
        storage_account_name = "tfstatedeventrega"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }

}

# Create public IPs
resource "azurerm_public_ip" "public_ip" {
 	count 					                  = var.public ? 1 : 0
  name                              = "${var.prefix}-public_ip"
  location                          = "${var.resource_group_location}"
  resource_group_name               = "${var.resource_group_name}"
  allocation_method    	            = "${var.allocation_method}"
}

resource "azurerm_network_interface" "main" {
	name                	            = "${var.prefix}-nic"
	resource_group_name 	            = "${var.resource_group_name}"
	location            	            = "${var.resource_group_location}"

	ip_configuration {
		name                            = "internal"
		subnet_id                       = "${var.subnet_id}"
		private_ip_address_allocation   = "${var.private_ip_address_allocation}"
		public_ip_address_id            = var.public == true ? azurerm_public_ip.public_ip[0].id : null
	}
}

resource "azurerm_windows_virtual_machine" "main" {
  name                              = "${var.prefix}-vm"
  resource_group_name               = "${var.resource_group_name}"
  location                          = "${var.resource_group_location}"
  size                              = "${var.size}"
  admin_username                    = "${var.user}"
  admin_password                    = "${var.password}"
  network_interface_ids             = [azurerm_network_interface.main.id]

  source_image_reference {
    publisher                       = "${var.publisher}"
    offer                           = "${var.offer}"
    sku                             = "${var.sku}"
    version                         = "${var.source_image_reference_version}"
  }

  os_disk {
    storage_account_type            = "${var.storage_account_type}"
    caching                         = "${var.caching}"
  }
}