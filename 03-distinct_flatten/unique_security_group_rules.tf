locals {
  rules = [
    { port = 22,  protocol = "tcp" },
    { port = 80,  protocol = "tcp" },
    { port = 443, protocol = "tcp" },
    { port = 80,  protocol = "tcp" }  # Duplicate
  ]
}

output "unique_security_rules" {
  value = distinct(local.rules)
}


# Mistake example - does not work

# output "wrong_usage" {
#   value = distinct({ "a" = 1, "b" = 2 })  # ❌ Maps are not supported
# }

# ✔ Fix:
# Use values() to extract the list before applying distinct().

# output "correct_usage" {
#   value = distinct(values({ "a" = 1, "b" = 2, "c" = 1 }))
# }
# ✔ Output: [1, 2]

# When to Use flatten() and distinct()?
# ✅ Use flatten() when dealing with nested lists and you need a single-level list.
# ✅ Use distinct() when dealing with duplicate values and you need only unique elements.
# ✅ Use both together to flatten nested lists and remove duplicates simultaneously.