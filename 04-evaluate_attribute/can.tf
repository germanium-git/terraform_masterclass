variable "vm" {
  type = object({
    name    = string
    os_type = optional(string)
    size    = optional(string)
  })
  default = {
    name    = "vm01"
    os_type = "linux"
  }
}

locals {
  has_size     = can(var.vm.size)
  has_os_type  = can(var.vm.os_type)
  has_os_image = can(var.vm.os_image)
}

output "has_size" { value = local.has_size }         # true (despite being optional, it's absent, so can() returns true)
output "has_os_type" { value = local.has_os_type }   # true
output "has_os_image" { value = local.has_os_image } # false


# In Terraform, can() checks if an expression can be evaluated without error.
# For optional attributes in objects, if the attribute is present (even if its value is null), can() returns true.


# 👉 Use can() for objects and attributes.
# 👉 Use contains(keys(...), key) for maps.


# Don’t do this — it’ll crash if the attribute doesn’t exist:
# variable.vm.size != null   # ❌ Error: Invalid index or attribute

# locals {
#   dont_do_this = var.vm.size_foo != null ? var.vm.size : null
# }

# │ Error: Unsupported attribute
# │
# │   on can.tf line 33, in locals:
# │   33:   dont_do_this = var.vm.size_foo != null ? var.vm.size : null
# │     ├────────────────
# │     │ var.vm is object with 3 attributes
# │
# │ This object does not have an attribute named "size_foo".