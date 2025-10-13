locals {
  vm = {
    name = "vm01"
    os   = "linux_os"
    config = {
      metadata = {
        os = "linux_metadata"
      }
    }
  }
  vm_has_size = can(local.vm.size)
  vm_size     = try(local.vm.size, null)
  os_value    = try(local.vm.config.metadata.os, local.vm.os, "unknown")
}


# ✅ It first tries metadata.os,
# then config.os,
# and finally defaults to "unknown" if neither exists.