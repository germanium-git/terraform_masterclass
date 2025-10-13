locals {
  nested_list = [
    ["a", "b"], ["c", "d"], ["e", ["f", "g"]]
  ]
}

output "flat_list" {
  value = flatten(local.nested_list)
}


locals {
  environments = ["dev", "test", "prod"]
  regions      = ["us-east-1", "us-west-1"]
}

output "region_env_pairs" {
  value = flatten([for region in local.regions : [for env in local.environments : "${region}-${env}"]])
}
