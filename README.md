<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.89.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_route.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route_table.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disable_bgp_route_propagation"></a> [disable\_bgp\_route\_propagation](#input\_disable\_bgp\_route\_propagation) | Boolean flag which controls propagation of routes learned by BGP on that route table. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the route table is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the route table. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the route table. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_routes"></a> [routes](#input\_routes) | n/a | <pre>map(object({<br>    name                   = string<br>    address_prefix         = string<br>    next_hop_type          = string<br>    next_hop_in_ip_address = optional(string, null)<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Route Table ID. |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | The collection of Subnets associated with this route table. |
<!-- END_TF_DOCS -->