create_resource_group 					= 	true
resource_group_name						= 	"mi-nombre-grupo-recursos"
resource_group_location					= 	"Central US"
resource_group_tags						= 	{
												ambiente = "dev"
											}
vnet_cidr								= 	["10.0.0.0/16"]
vnet_name								= 	"mi-vnet-nombre"
vnet_dns_servers						= 	[]
vnet_resource_tags						= 	{
												"vnet-etiquetas" = "vnet otras etiquetas"
											}
ddos_plan_name							= 	"nombre-plan ddos"
create_ddos_plan						= 	false
ddos_resource_tags						= 	{
												"etiqueta-ddos" = "otra-etiqueta-ddos"
											}
subnets									=	{	
												una = {
													name                                  = "misubnet01"
													cidr                                  = "10.0.1.0/24"
												    enforce_private_link_network_policies = false
												    service_endpoints                     =  ["Microsoft.Storage", "Microsoft.Sql"]
										  		},
										  		dos = {
													name                                  = "misubnet02"
													cidr                                  = "10.0.2.0/24"
												    enforce_private_link_network_policies = true
												    service_endpoints                     =  ["Microsoft.Storage"]
										  		}
										  	}
route_tables_ids						= 	{}
network_security_groups_ids				= 	{}