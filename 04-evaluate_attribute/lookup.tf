locals {
  lookup_config = {
    region = "eastus"
    size   = "Standard_B2s"
  }
}

output "region" {
  value = lookup(local.lookup_config, "region", "westus") # "eastus"
}

output "env" {
  value = lookup(local.lookup_config, "env", "dev") # "dev" (default)
}
