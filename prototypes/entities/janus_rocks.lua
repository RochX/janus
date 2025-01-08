local janus_big_rock = table.deepcopy(data.raw["simple-entity"]["big-rock"])

janus_big_rock.name = "janus-big-rock"

janus_big_rock.autoplace = {
  local_expressions = {
    control = 1,
    multiplier = 0.17000000000000002,
    penalty = 1,
    region_box = "range_select_base(moisture, 0.35, 1, 0.2, -10, 0)"
  },
  order = "a[doodad]-a[rock]-b[big]",
  placement_density = 6, -- increase number of times this is attempted to be placed
  probability_expression = "multiplier * control * (region_box + rock_density - penalty)"
}

janus_big_rock.minable.results = {
  {
    type = "item",
    name = "iron-ore",
    amount_min = 20,
    amount_max = 40
  },
  {
    type = "item",
    name = "copper-ore",
    amount_min = 20,
    amount_max = 40
  },
  {
    type = "item",
    name = "stone",
    amount_min = 20,
    amount_max = 40
  },
  {
    type = "item",
    name = "coal",
    amount_min = 20,
    amount_max = 40
  }
}
janus_big_rock.subgroup = "janus-planet-info"

data:extend({
  janus_big_rock
})
