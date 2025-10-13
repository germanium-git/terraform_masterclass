# Expanding function arguments

locals {
  list_of_lists = [
    ["a", "b"],
    ["c", "d"],
    ["e"]
  ]
}

output "single_list" {
  value       = concat(local.list_of_lists...)
  description = "Concatenated list from multiple lists"
}

output "single_list2" {
  value       = flatten(local.list_of_lists)
  description = "Flattened list from multiple lists"
}



# concat(local.list_of_lists)
# Terraform will treat it as one argument, producing a nested list.


# Argument expansion.
# concat(local.list_of_lists...)
# ... tells Terraform: “take this tuple/list and pass each element as its own argument to the function.”
# result: ["a", "b", "c", "d", "e"]