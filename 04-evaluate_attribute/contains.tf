locals {
  tags = {
    environment = "dev"
    owner       = "alice"
  }

  has_cost_center = contains(keys(local.tags), "costCenter") # returns false
  has_owner       = contains(keys(local.tags), "owner")      # returns true
}
