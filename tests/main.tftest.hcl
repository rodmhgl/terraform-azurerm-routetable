provider "azurerm" {
  features {}
}

variables {
  disable_bgp_route_propagation = false
  location                      = "eastus"
  name                          = "routetabletest"
  resource_group_name           = "routetabletest-rg"
  routes = {
    test_route = {
      name                   = "test_route"
      address_prefix         = "10.0.0.0/8"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "172.20.0.52"
    }
    internet_route = {
      name                   = "internet_route"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "Internet"
    }
  }
  tags = {
    environment = "staging"
  }
}

run "plan_minimum_input" {
  command = plan
}

run "setup" {
  command = apply

  module {
    source = "./tests/setup"
  }

}

run "apply" {

  variables {
    resource_group_name = run.setup.name
  }

  command = apply

  assert {
    condition = azurerm_route_table.this.location == var.location
    error_message = "Route table location is not as expected."
  }

  assert {
    condition = azurerm_route_table.this.resource_group_name == var.resource_group_name
    error_message = "Route table resource_group_name is not as expected."
  }

  assert {
    condition = azurerm_route_table.this.disable_bgp_route_propagation == var.disable_bgp_route_propagation
    error_message = "Route table disable_bgp_route_propagation is not as expected."
  }
}

