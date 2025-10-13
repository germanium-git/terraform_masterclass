locals {
  enemies_list = [
    { name = "luke", enemies_destroyed = 4252 },
    { name = "yoda", enemies_destroyed = 900 },
    { name = "darth", enemies_destroyed = 20000056894 },
  ]

  map = tomap({
    for character in local.enemies_list :
    character.name => { enemies_destroyed = character.enemies_destroyed }
  })

  map2 = {
    for character in local.enemies_list :
    character.name => { enemies_destroyed = character.enemies_destroyed }
  }
}