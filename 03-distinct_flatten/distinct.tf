locals {
  duplicates_list = [
    "apple",
    "banana",
    "apple",
    "orange",
    "banana"
  ]
  nested_duplicate_list = [
    ["apple", "banana"],
    ["banana", "orange"],
    ["apple", "grape"]
  ]
}

output "unique_list" {
  value = distinct(local.duplicates_list)
}

output "unique_flattened_list" {
  value = distinct(flatten(local.nested_duplicate_list))
}