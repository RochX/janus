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

data:extend({fast_inserter})