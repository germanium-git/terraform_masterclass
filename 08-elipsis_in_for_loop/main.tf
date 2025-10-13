locals {
  source_data = {
    foo = {
      name = "foo"
      type = "something_foo"
    }
    bar = {
      name = "bar"
      type = "something_bar"
    }
    bar2 = {
      name = "bar2"
      type = "something_bar"
    }
  }
}

locals {
  key_id = {
  for x in local.source_data : x.type => x... }
}

# without ellipsis, this errors with:
# Error: Duplicate key in map construction
# │   on main.tf line 20, in locals:
# │   19:   key_id = {
# │   20:     for x in local.source_data : x.type => x}
# │     ├────────────────
# │     │ x.type is "something_bar"
# │
# │ Two different items produced the key "something_bar" in this 'for' expression. If duplicates are expected, use the ellipsis (...) after the value expression to enable grouping by key.
