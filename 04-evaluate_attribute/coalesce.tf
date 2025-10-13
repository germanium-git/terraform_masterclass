# The coalesce function in Terraform takes any number of arguments and returns the first one that isn't null or an empty string.
# This function is useful for setting default values for variables.
# If the first argument to coalesce is set (i.e., it's not null or an empty string), that value will be used.
# If the first argument isn’t set, coalesce will check the second argument, and so on, until it finds a set value.
# If none of the arguments are set, coalesce will return null.


variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = null
}


variable "custom_name" {
  description = "The custom name to override the default name"
  type        = string
  default     = null
}


locals {
  env           = coalesce(var.environment, "dev")
  resource_name = coalesce(var.custom_name, "default-name")
}
