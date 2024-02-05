output "id" {
  description = "The Route Table ID."
  value       = azurerm_route_table.this.id
}

output "subnets" {
  description = "The collection of Subnets associated with this route table."
  value       = azurerm_route_table.this.subnets
}
