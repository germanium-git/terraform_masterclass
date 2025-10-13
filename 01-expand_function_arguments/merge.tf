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

locals {
  databases = [
    {
      "prod_db" : { name = "prod-db", tier = "db.t3.medium" }
      "prod_app" : { name = "prod-app", tier = "app.t3.medium" }
    },
    {
      "stage_db" : { name = "stage-db", tier = "db.t3.small" }
      "stage_app" : { name = "stage-app", tier = "app.t3.small" }
    },
    {
      "dev_db" : { name = "dev-db", tier = "db.t3.micro" }
      "dev_app" : { name = "dev-app", tier = "app.t3.micro" }
    }
  ]

  db_merged_expanded = merge(local.databases...)
}
