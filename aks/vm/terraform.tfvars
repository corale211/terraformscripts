prefix 								= 	"demo-1"
resource_group_name					=	"mi-nombre-grupo-recursos-2"
resource_group_location				= 	"Central US"
size 								=	"Standard_F2"
user								=	"adminuser"
password 							=	"P@ssw0rd1234!"	
public								= 	true
#az network vnet subnet list -g mi-nombre-grupo-recursos-2 --vnet-name mi-vnet-nombre
subnet_id							=	"/subscriptions/d8d5d6c7-b940-4c69-8630-c51c498c0e58/resourceGroups/mi-nombre-grupo-recursos-2/providers/Microsoft.Network/virtualNetworks/mi-vnet-nombre/subnets/misubnet01"
allocation_method					=	"Dynamic"
private_ip_address_allocation		=	"Dynamic"
publisher 							= 	"MicrosoftWindowsServer"
offer     							= 	"WindowsServer"
sku       							= 	"2016-Datacenter"
source_image_reference_version      = 	"latest"
storage_account_type 				= 	"Standard_LRS"
caching              				= 	"ReadWrite"