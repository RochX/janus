fast_inserter = {
  auto_recycle=false,
  type = "recipe",
  name = "janus-fast-inserter",
  subgroup = "janus-time-shifted",
  category="janus-shiftite",
  ingredients = {
    {type="item", name="fast-inserter", amount=1},
    {type="item", name="janus-shiftite-alpha", amount=5},
    {type="item", name="janus-shiftite-beta", amount=3},
    {type="item", name="janus-shiftite-omega", amount=1}
  },
  energy_required = 3,
  results = {{type="item", name="janus-fast-inserter", amount=1}},
  enabled=false
}

afterburner_thruster = {
  type = "recipe",
  name = "janus-thruster",
  subgroup = "janus-time-shifted",
  category = "janus-shiftite",
  ingredients = {
    {type="item", name="thruster", amount=1},
    {type="item", name="janus-shiftite-omega", amount=5},
    {type="item", name="low-density-structure", amount=10}
  },
  energy_required = 30,
  results = {{type="item", name="janus-thruster", amount=1}},
  enabled=false
}

afterburner_fuel = {
  type = "recipe",
  name = "janus-thruster-fuel",
  subgroup = "janus-time-shifted",
  category = "chemistry-or-cryogenics",
  icon = "__janus__/graphics/time-shifted/thruster/janus-thruster-fuel.png",
  surface_conditions = {{property="gravity", min=0, max=0}},
  ingredients = {
    {type="fluid", name="thruster-fuel", amount=1000},
    {type="item", name="janus-shiftite-alpha", amount=10}
  },
  energy_required = 10,
  results = {
    {type="fluid", name="janus-thruster-fuel", amount=1000},
    {type="item", name="janus-shiftite-beta", amount=8, ignored_by_productivity=8}
  },
  enabled=false
}

data:extend({fast_inserter, afterburner_thruster, afterburner_fuel})