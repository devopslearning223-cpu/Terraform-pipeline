output "lb_id" {
  value       = azurerm_lb.lb.id
  description = "Load Balancer ID"
}

output "lb_public_ip" {
  value       = azurerm_public_ip.lb_pip.ip_address
  description = "Load Balancer Public IP Address"
}

output "backend_pool_id" {
  value       = azurerm_lb_backend_address_pool.backend_pool.id
  description = "Load Balancer Backend Address Pool ID"
}
