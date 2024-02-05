resource "random_pet" "this" {
  length    = 2
  separator = "-"
}

resource "azurerm_resource_group" "this" {
  location = "eastus"
  name     = "${random_pet.this.id}-rg"
}

output "name" {
  value = azurerm_resource_group.this.name
}
