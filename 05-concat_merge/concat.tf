# The Terraform concat function works with lists containing any data type such as string, numbers, booleans.
# However, all the lists that you want to concat must have compatible data types.

variable "dev_servers" {
  default = ["dev-server-1", "dev-server-2"]
}

variable "stg_servers" {
  default = ["s-tgserver-1", "stg-server-2"]
}

variable "prod_servers" {
  default = ["prod-server-1", "prod-server-2"]
}

output "all_servers" {
  value = concat(var.dev_servers, var.stg_servers, var.prod_servers)
}

# Output:

# all_servers = [
#   "dev-server-1",
#   "dev-server-2",
#   "stg-server-1",
#   "stg-server-2",
#   "prod-server-1",
#   "prod-server-2"
# ]


# Concatenating Lists with Mixed Data Types
# The Terraform concat function doesn’t support the list with mixed data type natively but you can use the type conversion or handle data validation logic manually.

variable "extra_servers" {
  default = ["extra-server-1", "extra-server-2"]
}

variable "add_extra" {
  default = true
}

output "final_servers" {
  value = concat(["base-server-1", "base-server-2"], var.add_extra ? var.extra_servers : [])
}

# Output if add_extra is true:

# final_servers = [
#   "base-server-1",
#   "base-server-2",
#   "extra-server-1",
#   "extra-server-2"
# ]
