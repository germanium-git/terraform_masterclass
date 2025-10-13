locals {
  VMs-A = [
    {
      name  = "VM One"
      id    = "vm1_id"
      tags  = ["prod", "web"]
      disks = ["os", "data"]
    },
    {
      name  = "VM Three"
      id    = "vm3_id"
      tags  = ["dev"]
      disks = ["os"]
    }
  ]

  VMs-B = [
    {
      name  = "VM THREE"
      id    = "vm3_ID"
      tags  = ["test", "ci"]
      disks = ["os", "temp"]
    }
  ]
}

locals {
  VMs_flattened = flatten([
    for vm in concat(local.VMs-A, local.VMs-B) : {
      id    = lower(vm.id)   # normalize to lowercase
      name  = lower(vm.name) # normalize to lowercase
      tags  = try(vm.tags, [])
      disks = try(vm.disks, [])
    }
  ])

  VMs_grouped = {
    for o in local.VMs_flattened :
    o.id => o... # grouping syntax (...) to collect all matching items under the same key — i.e. not just deduplicate, but group all VMs that share the same ID (case-insensitive).
  }

  VMs_unique = {
    for id, vms in local.VMs_grouped : id => {
      id = id
      # Prefer the first VM’s name (or join if you like)
      name = vms[0].name
      # Merge and deduplicate all tags/disks
      tags  = distinct(flatten([for v in vms : v.tags]))
      disks = distinct(flatten([for v in vms : v.disks]))
    }
  }
}

output "VMs_flattened" {
  value = local.VMs_flattened
}

output "VMs_grouped" {
  value = local.VMs_grouped
}

output "VMs_unique" {
  value = local.VMs_grouped
}


# Splat expressions ([*].id) only work on lists, not maps.
# terraform console
# local.VMs_flattened[*].id

output "VM_IDs" {
  value = local.VMs_flattened[*].id
}

output "VM_IDs_2" {
  value = [for vm in local.VMs_flattened : vm.id]
}


# The splat expression patterns shown above apply only to lists, sets, and tuples.
# To get a similar result with a map or object value you must use for expressions.
# Or use values() to get a list of the map’s values:

locals {
  vm_list = values(local.VMs_unique)
}

output "vm_ids_splat" {
  value = local.vm_list[*].id
}