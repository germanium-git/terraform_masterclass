locals {
  min_number = min([55, 2453, 2]...)
}

output "min_number" {
  value       = local.min_number
  description = "Minimum value of a number from the list"
}
