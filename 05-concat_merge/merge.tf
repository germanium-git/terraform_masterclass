# The Terraform merge function takes two or more map objects and returns the combined output out single map.

# Example 1: Merging Two Simple Maps with Overlapping Keys =================================================
variable "ex1_map1" {
  default = {
    environment = "development"
    region      = "us-east-1"
  }
}

variable "ex1_map2" {
  default = {
    region = "us-west-2"
    owner  = "devops_team"
  }
}

output "ex1_merged_map" {
  value = merge(var.ex1_map1, var.ex1_map2)
}

# Result:
# {
#   environment = "development"
#   region      = "us-west-2"
#   owner       = "devops_team"
# }
# Here, the region value from map2 overwrites the region in map1, shows how merge handles duplicate keys by prioritizing the rightmost map.



# The region value from map2 overwrites the region in map1, shows how merge handles duplicate keys by prioritizing the rightmost map.

# Example 2: Merging Maps with Unique Keys ==================================================================
variable "ex2_map1" {
  default = {
    project = "terraform-merge"
  }
}

variable "ex2_map2" {
  default = {
    cost_center = "001145"
  }
}

output "ex2_merged_map" {
  value = merge(var.ex2_map1, var.ex2_map2)
}

# Result:
# {
#   project     = "terraform-merge"
#   cost_center = "001145"
# }
# In this case, there are no overlapping or duplicating keys between map1 and map2, hence both key-value pairs are included in the final merged map.


# Example 3: Merging Multiple Maps with Overlapping Keys ==========================================================
variable "ex3_map1" {
  default = {
    env = "prod"
    instance_type = "t2.micro"
  }
}

variable "ex3_map2" {
  default = {
    instance_type = "t2.medium"
    region        = "us-east-1"
  }
}
variable "ex3_map3" {
  default = {
    region = "us-west-1"
    owner  = "ops_team"
  }
}

output "ex3_merged_map" {
  value = merge(var.ex3_map1, var.ex3_map2, var.ex3_map3)
}

# Result:
# {
#   env           = "prod"
#   instance_type = "t2.medium"
#   region        = "us-west-1"
#   owner         = "ops_team"
# }
# The final values for instance_type and region are taken from the last maps (map2 and map3), showing how the order affects which values are retained.
