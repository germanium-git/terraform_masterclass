locals {
  vms = [
    { name = "vm1", size = "Standard_B1s" },
    { name = "vm2", size = "Standard_D2s_v3" },
    { name = "vm3", size = "Standard_B1s" }
  ]

  # Use a for loop with a conditional expression
  small_vms = [
    for vm in local.vms : vm.name
    if vm.size == "Standard_B1s"
  ]
}


output "small_vms" {
  value = [for vm in local.vms : vm.name
  if vm.size == "Standard_B1s"]
}
