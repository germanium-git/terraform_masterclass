# We want to create IAM policies where users belong to multiple groups and might be assigned duplicate policies.
# We can use flatten() and distinct() to ensure that each user gets only unique policies.

locals {
  user_groups = {
    alice   = ["admin", "developer"]
    bob     = ["developer", "viewer"]
    charlie = ["admin", "viewer"]
  }
  group_policies = {
    admin     = ["full-access", "logging"]
    developer = ["write-access", "read-access"]
    viewer    = ["read-access", "logging"]
  }
}


output "user_policies" {
  value = {
    for user, groups in local.user_groups :
    user => distinct(flatten([for group in groups : local.group_policies[group]]))
  }
}

locals {
  user_policies = {
    for user, groups in local.user_groups :
    user => distinct(flatten([for group in groups : local.group_policies[group]]))
  }
}

# terraform console
# > local.user_policies
# {
#   "alice" = tolist([
#     "full-access",
#     "logging",
#     "write-access",
#     "read-access",
#   ])
#   "bob" = tolist([
#     "write-access",
#     "read-access",
#     "logging",
#   ])
#   "charlie" = tolist([
#     "full-access",
#     "logging",
#     "read-access",
#   ])
# }