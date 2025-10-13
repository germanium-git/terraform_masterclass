locals {
  values = [null, "", "hello"]
  result = coalesce(local.values...) # ✅ expands to coalesce(null, "", "hello")
}

output "coalesce_result" {
  value = local.result
}
