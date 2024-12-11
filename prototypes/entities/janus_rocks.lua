local janus_big_rock = table.deepcopy(data.raw["simple-entity"]["big-rock"])

janus_big_rock.name = "janus-big-rock"

-- increase number of rocks spawned
janus_big_rock.autoplace.placement_density = 10

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
