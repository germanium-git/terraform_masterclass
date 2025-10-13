locals {
  test_data = {
    test = {
      vm1 = {
        name = "example-test"
        id   = "12345"
      }
      vm2 = {
        name = "example-test"
        id   = "56789"
      }
    }
    dev = {
      vm1 = {
        name = "example-dev"
        id   = "12345"
      }
    }
    prod = {
      vm1 = {
        name = "example-prod"
        id   = "54321"
      }
    }
  }


  # Nested loop with flattening using ellipsis
  all_vms_by_id = merge([
    for env, vms in local.test_data : {
      for vm in values(vms) : vm.id => vm
    }
  ]...) # ✅ expands to merge({12345={name="example-test",id="12345"},56789={name="example-test",id="56789"}}, {12345={name="example-dev",id="12345"}}, {54321={name="example-prod",id="54321"}})

}

# > local.all_vms_by_id
# {
#   "12345" = {
#     "id" = "12345"
#     "name" = "example-test"
#   }
#   "54321" = {
#     "id" = "54321"
#     "name" = "example-prod"
#   }
#   "56789" = {
#     "id" = "56789"
#     "name" = "example-test"
#   }
# }


# │ Error: Error in function call
# │
# │   on nested_loop.tf line 29, in locals:
# │   29:   all_vms_by_id = merge([
# │   30:     for env, vms in local.test_data : {
# │   31:       for vm in values(vms) : vm.id => vm
# │   32:     }
# │   33:   ])
# │     ├────────────────
# │     │ while calling merge(maps...)
# │     │ local.test_data is object with 3 attributes
# │
# │ Call to function "merge" failed: arguments must be maps or objects, got "tuple".
