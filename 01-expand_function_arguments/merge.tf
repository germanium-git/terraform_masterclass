locals {
  maps = [
    { a = 1 },
    { b = 2 },
    { c = 3 }
  ]

  merged = merge(local.maps...) # ✅ expands to merge({a=1}, {b=2}, {c=3})
}

output "merged" {
  value       = local.merged
  description = "Merged map from multiple maps"
}