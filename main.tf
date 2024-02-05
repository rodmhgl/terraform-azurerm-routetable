provider "azurerm" {
  features {
  }
}

resource "azurerm_route_table" "this" {
  location                      = var.location
  name                          = var.name
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  tags                          = var.tags

  lifecycle {
    ignore_changes = [
      route,
      tags["updated"],
      tags["created_on"],
    ]
  }
}

resource "azurerm_route" "this" {
  for_each = var.routes

  name                   = each.key
  resource_group_name    = var.resource_group_name
  address_prefix         = each.value.address_prefix
  next_hop_type          = each.value.next_hop_type
  next_hop_in_ip_address = each.value.next_hop_in_ip_address
  route_table_name       = azurerm_route_table.this.name
}
